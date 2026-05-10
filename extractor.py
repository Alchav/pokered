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


def parse_archipelago_label(symbol, address):
    key = symbol.split("Archipelago_", 1)[1]
    if "LD_A" in symbol:
        return key.replace("_LD_A", "").replace("LD_A_", ""), address + 1
    if "Missable" in symbol:
        return key, address + 6
    if "Event" in symbol or "Hidden_Item" in symbol:
        return key, address + 2

    prefix, separator, suffix = key.rpartition("_")
    if separator and suffix.isdigit():
        return prefix, address + int(suffix)
    return key, address


def extract_rom_addresses(sym_file):
    addresses = {}
    with open(pokered_addr + sym_file, "r") as file:
        for line in file:
            line = line.strip()
            if not line:
                continue

            parts = line.split()
            if len(parts) < 2:
                continue

            symbol = parts[1]
            if ".Archipelago_" in symbol:
                address = parse_rom_address(parts[0])
                key, address = parse_archipelago_label(symbol, address)
                addresses[key] = address
            elif "_Object" in symbol:
                address = parse_rom_address(parts[0])
                address += 4
                map_name = symbol.split("_Object", 1)[0]
                addresses["Warps_" + map_name] = address
            elif symbol.endswith("WarpMaps"):
                address = parse_rom_address(parts[0])
                addresses[symbol] = address

    return addresses


def write_address_dict(file, name, addresses):
    file.write(name + " = {\n")
    for key, address in addresses.items():
        file.write("    \"" + key + "\": " + hex(address) + ",\n")
    file.write("}\n")


red_addresses = extract_rom_addresses("pokered.sym")
blue_addresses = extract_rom_addresses("pokeblue.sym")
yellow_addresses = extract_rom_addresses("pokeyellow.sym")
blue_differences = {
    key: address
    for key, address in blue_addresses.items()
    if red_addresses.get(key) != address
}

with open(world_addr + "rom_addresses.py", "w") as file:
    write_address_dict(file, "rom_addresses_red", red_addresses)
    file.write("\nrom_addresses_blue = rom_addresses_red.copy()\n")
    if blue_differences:
        file.write("rom_addresses_blue |= {\n")
        for key, address in blue_differences.items():
            file.write("    \"" + key + "\": " + hex(address) + ",\n")
        file.write("}\n")
    file.write("\n")
    write_address_dict(file, "rom_addresses_yellow", yellow_addresses)


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


import bsdiff4
bluepatch = bsdiff4.diff(blue, blueap)
redpatch = bsdiff4.diff(red, redap)
yellowpatch = bsdiff4.diff(yellow, yellowap)

with open(world_addr + "basepatch_blue.bsdiff4", "bw") as file:
    file.write(bluepatch)
with open(world_addr + "basepatch_red.bsdiff4", "bw") as file:
    file.write(redpatch)
with open(world_addr + "basepatch_yellow.bsdiff4", "bw") as file:
    file.write(yellowpatch)
