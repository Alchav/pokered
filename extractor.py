EXTRACT_ROM_SETS = "red_blue"  # "red_blue", "yellow", or "both"

import os
import subprocess

repo_addr = os.path.abspath(os.getcwd()) + os.sep
world_addr = os.path.abspath(os.path.join(repo_addr, "..", "Archipelago", "worlds", "pokemon_rby")) + os.sep

# change to the correct folders on your machine
# put original pokemon files in the configured repo folder, such as "pokered_orig.gbc" and "pokeblue_orig.gbc"
# build the configured repo so that the baseroms are created along with the .sym files
# run this script

VALID_ROM_SETS = {"red_blue", "yellow", "both"}
if EXTRACT_ROM_SETS not in VALID_ROM_SETS:
    raise ValueError(f"EXTRACT_ROM_SETS must be one of {sorted(VALID_ROM_SETS)}")

EXTRACT_RED_BLUE = EXTRACT_ROM_SETS in {"red_blue", "both"}
EXTRACT_YELLOW = EXTRACT_ROM_SETS in {"yellow", "both"}


def parse_rom_address(address):
    bank, offset = address.split(":")
    if int(bank, 16) == 0:
        return int(offset, 16)
    return (int(bank, 16) * 0x4000) + (int(offset, 16) - 0x4000)


def parse_sym_address(address):
    bank_str, offset_str = address.split(":")
    bank = int(bank_str, 16)
    offset = int(offset_str, 16)
    if bank == 0 and 0xC000 <= offset < 0xE000:
        return "WRAM", offset - 0xC000
    return "ROM", parse_rom_address(address)


def parse_archipelago_label(symbol, address, address_space):
    key = symbol.split("Archipelago_", 1)[1]
    if address_space == "ROM" and "LD_A" in symbol:
        return key.replace("_LD_A", "").replace("LD_A_", ""), address + 1
    if address_space == "ROM" and "Missable" in symbol:
        return key, address + 6
    if address_space == "ROM" and ("Event" in symbol or "Hidden_Item" in symbol):
        return key, address + 2

    prefix, separator, suffix = key.rpartition("_")
    if separator and suffix.isdigit():
        return prefix, address + int(suffix)
    return key, address


def load_repo_file(ref, path):
    return subprocess.run(
        ["git", "-C", repo_addr, "show", f"{ref}:{path}"],
        check=True,
        capture_output=True,
        text=True,
    ).stdout


def extract_missable_flags(ref):
    flags = {}
    current_value = None
    for line in load_repo_file(ref, "constants/hide_show_constants.asm").splitlines():
        stripped = line.strip()
        if stripped.startswith("const_def"):
            current_value = 0
            continue
        if current_value is None or not stripped.startswith("const "):
            continue

        parts = stripped.split()
        if len(parts) < 2:
            continue

        symbol = parts[1]
        if not symbol.startswith("HS_"):
            continue

        flags[symbol] = current_value
        current_value += 1

    return flags


WRAM_SYMBOL_KEYS = {
    "wArchipelagoDeathLink": "Deathlink",
    "wArchipelagoItemReceived": "APItem",
    "wArchipelagoGameStarted": "GameStatus",
    "wd728": "Rod",
    "wPlayerMoney": "Money",
    "wCurMap": "CurrentMap",
    "CrashCheck2": "CrashCheck2",
    "wMissableObjectFlags": "Missable",
    "wArchipelagoItemsReceivedCount": "ItemIndex",
    "wArchipelagoProgressiveKeys": "CrashCheck3",
    "wDexSanity": "DexSanityFlag",
    "wObtainedHiddenItemsFlags": "Hidden",
    "wFirstLockTrashCanIndex": "CrashCheck1",
    "wEventFlags": "EventFlag",
}


# These hooks are emitted by generic macros but do not correspond to AP location checks:
# alias labels that share a canonical hook, and static encounter trainer headers that already
# have dedicated Static_Encounter locations.
IGNORED_ROM_HOOKS = {
    "Trainersanity_EVENT_BATTLED_RIVAL_IN_OAKS_LAB_ITEM",
    "Trainersanity_EVENT_FOUND_ROCKET_HIDEOUT_ITEM",
    "Trainersanity_EVENT_GOT_NUGGET_ITEM",
    "Trainersanity_EVENT_BEAT_ARTICUNO_ITEM",
    "Trainersanity_EVENT_BEAT_MEWTWO_ITEM",
    "Trainersanity_EVENT_BEAT_MEW_ITEM",
    "Trainersanity_EVENT_BEAT_MOLTRES_ITEM",
    "Trainersanity_EVENT_BEAT_POWER_PLANT_VOLTORB_0_ITEM",
    "Trainersanity_EVENT_BEAT_POWER_PLANT_VOLTORB_1_ITEM",
    "Trainersanity_EVENT_BEAT_POWER_PLANT_VOLTORB_2_ITEM",
    "Trainersanity_EVENT_BEAT_POWER_PLANT_VOLTORB_3_ITEM",
    "Trainersanity_EVENT_BEAT_POWER_PLANT_VOLTORB_4_ITEM",
    "Trainersanity_EVENT_BEAT_POWER_PLANT_VOLTORB_5_ITEM",
    "Trainersanity_EVENT_BEAT_POWER_PLANT_VOLTORB_6_ITEM",
    "Trainersanity_EVENT_BEAT_POWER_PLANT_VOLTORB_7_ITEM",
    "Trainersanity_EVENT_BEAT_ZAPDOS_ITEM",
}


def extract_rom_addresses(sym_file):
    rom_addresses = {}
    wram_addresses = {}
    with open(repo_addr + sym_file, "r") as file:
        for line in file:
            line = line.strip()
            if not line:
                continue

            parts = line.split()
            if len(parts) < 2:
                continue
            if ":" not in parts[0]:
                continue

            symbol = parts[1]
            address_space, address = parse_sym_address(parts[0])
            if ".Archipelago_" in symbol:
                key, address = parse_archipelago_label(symbol, address, address_space)
                if address_space == "WRAM":
                    wram_addresses[key] = address
                elif key not in IGNORED_ROM_HOOKS:
                    rom_addresses[key] = address
            elif address_space == "WRAM" and symbol in WRAM_SYMBOL_KEYS:
                wram_addresses[WRAM_SYMBOL_KEYS[symbol]] = address
            elif address_space == "ROM" and "_Object" in symbol:
                address += 4
                map_name = symbol.split("_Object", 1)[0]
                rom_addresses["Warps_" + map_name] = address
            elif address_space == "ROM" and symbol.endswith("WarpMaps"):
                rom_addresses[symbol] = address

    if "CrashCheck4" not in wram_addresses and "Hidden" in wram_addresses:
        wram_addresses["CrashCheck4"] = wram_addresses["Hidden"] - 1

    return rom_addresses, wram_addresses


def write_address_dict(file, name, addresses):
    file.write(name + " = {\n")
    for key, address in addresses.items():
        file.write("    \"" + key + "\": " + hex(address) + ",\n")
    file.write("}\n")


def load_existing_address_dicts():
    path = world_addr + "rom_addresses.py"
    if not os.path.exists(path):
        return {}
    namespace = {}
    with open(path, "r") as file:
        exec(compile(file.read(), path, "exec"), {}, namespace)
    return namespace


def assert_same(name, red_data, blue_data):
    if red_data != blue_data:
        raise AssertionError(f"Red and Blue {name} diverged")


existing_addresses = load_existing_address_dicts()

if EXTRACT_RED_BLUE:
    red_addresses, red_wram_addresses = extract_rom_addresses("pokered.sym")
    blue_addresses, blue_wram_addresses = extract_rom_addresses("pokeblue.sym")
    rb_missable_flags = extract_missable_flags("pokemon-archipelago")
    assert_same("ROM addresses", red_addresses, blue_addresses)
    assert_same("WRAM addresses", red_wram_addresses, blue_wram_addresses)
else:
    red_addresses = existing_addresses["rom_addresses_rb"]
    red_wram_addresses = existing_addresses["wram_addresses_rb"]
    rb_missable_flags = existing_addresses["missable_flags_rb"]

if EXTRACT_YELLOW:
    yellow_addresses, yellow_wram_addresses = extract_rom_addresses("pokeyellow.sym")
    yellow_missable_flags = extract_missable_flags("yellow-archipelago")
else:
    yellow_addresses = existing_addresses["rom_addresses_yellow"]
    yellow_wram_addresses = existing_addresses["wram_addresses_yellow"]
    yellow_missable_flags = existing_addresses["missable_flags_yellow"]

with open(world_addr + "rom_addresses.py", "w") as file:
    write_address_dict(file, "rom_addresses_rb", red_addresses)
    file.write("\n\n")
    write_address_dict(file, "rom_addresses_yellow", yellow_addresses)
    file.write("\n\n")
    write_address_dict(file, "wram_addresses_rb", red_wram_addresses)
    file.write("\n\n")
    write_address_dict(file, "wram_addresses_yellow", yellow_wram_addresses)
    file.write("\n\n")
    write_address_dict(file, "missable_flags_rb", rb_missable_flags)
    file.write("\n\n")
    write_address_dict(file, "missable_flags_yellow", yellow_missable_flags)

basepatch_specs = []
if EXTRACT_RED_BLUE:
    basepatch_specs += [
        ("blue", repo_addr + "pokeblue_orig.gbc", repo_addr + "pokeblue.gbc",
         world_addr + "basepatch_blue.bsdiff4"),
        ("red", repo_addr + "pokered_orig.gbc", repo_addr + "pokered.gbc",
         world_addr + "basepatch_red.bsdiff4"),
    ]
if EXTRACT_YELLOW:
    basepatch_specs.append(
        ("yellow", repo_addr + "pokeyellow_orig.gbc", repo_addr + "pokeyellow.gbc",
         world_addr + "basepatch_yellow.bsdiff4")
    )

basepatch_paths = [
    path for _, original_path, patched_path, _ in basepatch_specs
    for path in (original_path, patched_path)
]
if not all(os.path.exists(path) for path in basepatch_paths):
    print("base ROM files missing; skipping basepatch generation")
else:
    try:
        import bsdiff4
    except ImportError:
        print("bsdiff4 not installed; skipping basepatch generation")
    else:
        for _, original_path, patched_path, patch_path in basepatch_specs:
            with open(original_path, "br") as file:
                original = bytes(file.read())
            with open(patched_path, "br") as file:
                patched = bytes(file.read())
            with open(patch_path, "bw") as file:
                file.write(bsdiff4.diff(original, patched))
