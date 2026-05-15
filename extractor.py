pokered_addr = "/home/alchav/PycharmProjects/pokered/"
world_addr = "/home/alchav/PycharmProjects/Archipelago/worlds/pokemon_rb/"

# change to the correct folders on your machine
# put original pokemon files in pokered folder as "pokered_orig.gbc" and "pokeblue_orig.gbc"
# build pokered so that the baseroms are created along with the .sym files
# run this script

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


def extract_rom_addresses(sym_file):
    rom_addresses = {}
    wram_addresses = {}
    with open(pokered_addr + sym_file, "r") as file:
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
                else:
                    rom_addresses[key] = address
            elif address_space == "ROM" and "_Object" in symbol:
                address += 4
                map_name = symbol.split("_Object", 1)[0]
                rom_addresses["Warps_" + map_name] = address
            elif address_space == "ROM" and symbol.endswith("WarpMaps"):
                rom_addresses[symbol] = address

    return rom_addresses, wram_addresses


def write_address_dict(file, name, addresses):
    file.write(name + " = {\n")
    for key, address in addresses.items():
        file.write("    \"" + key + "\": " + hex(address) + ",\n")
    file.write("}\n")


red_addresses, red_wram_addresses = extract_rom_addresses("pokered.sym")
blue_addresses, blue_wram_addresses = extract_rom_addresses("pokeblue.sym")
yellow_addresses, yellow_wram_addresses = extract_rom_addresses("pokeyellow.sym")
blue_differences = {
    key: address
    for key, address in blue_addresses.items()
    if red_addresses.get(key) != address
}
wram_blue_differences = {
    key: address
    for key, address in blue_wram_addresses.items()
    if red_wram_addresses.get(key) != address
}

with open(world_addr + "rom_addresses.py", "w") as file:
    write_address_dict(file, "rom_addresses_red", red_addresses)
    file.write("\nrom_addresses_blue = rom_addresses_red.copy()\n")
    if blue_differences:
        file.write("rom_addresses_blue |= {\n")
        for key, address in blue_differences.items():
            file.write("    \"" + key + "\": " + hex(address) + ",\n")
        file.write("}\n")
    file.write("\n\n")
    write_address_dict(file, "rom_addresses_yellow", yellow_addresses)
    file.write("\n\n")
    write_address_dict(file, "wram_addresses_red", red_wram_addresses)
    file.write("\nwram_addresses_blue = wram_addresses_red.copy()\n")
    if wram_blue_differences:
        file.write("wram_addresses_blue |= {\n")
        for key, address in wram_blue_differences.items():
            file.write("    \"" + key + "\": " + hex(address) + ",\n")
        file.write("}\n")
    file.write("\n\n")
    write_address_dict(file, "wram_addresses_yellow", yellow_wram_addresses)


with open(pokered_addr + "pokeblue_orig.gbc", "br") as file:
    blue = bytes(file.read())
with open(pokered_addr + "pokered_orig.gbc", "br") as file:
    red = bytes(file.read())
with open(pokered_addr + "pokeyellow_orig.gbc", "br") as file:
    yellow = bytes(file.read())

with open(pokered_addr + "pokeblue.gbc", "br") as file:
    blueap = bytes(file.read())
with open(pokered_addr + "pokered.gbc", "br") as file:
    redap = bytes(file.read())
with open(pokered_addr + "pokeyellow.gbc", "br") as file:
    yellowap = bytes(file.read())

try:
    import bsdiff4
except ImportError:
    print("bsdiff4 not installed; skipping basepatch generation")
else:
    bluepatch = bsdiff4.diff(blue, blueap)
    redpatch = bsdiff4.diff(red, redap)
    yellowpatch = bsdiff4.diff(yellow, yellowap)

    with open(world_addr + "basepatch_blue.bsdiff4", "bw") as file:
        file.write(bluepatch)
    with open(world_addr + "basepatch_red.bsdiff4", "bw") as file:
        file.write(redpatch)
    with open(world_addr + "basepatch_yellow.bsdiff4", "bw") as file:
        file.write(yellowpatch)
