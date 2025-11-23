pokered_addr = "/home/alchav/PycharmProjects/pokered/"
world_addr = "/home/alchav/PycharmProjects/Archipelago/worlds/pokemon_rb/"

# change to the correct folders on your machine
# put original pokemon files in pokered folder as "pokered_orig.gbc" and "pokeblue_orig.gbc"
# build pokered so that the baseroms are created along with the .sym files
# run this script

file = open(pokered_addr + "pokeblue.sym", "r")
data = file.read()
file.close()
file = open(world_addr + "rom_addresses.py", "w")
file.write("rom_addresses = {\n")
count = 0
for line in data.split("\n"):
    if ".Archipelago_" in line:
        address = line.split(" ")[0]
        address = address.split(":")
        if int(address[0], 16) == 0:
            address = int(address[1], 16)
        else:
            address = (int(address[0], 16) * 0x4000) + int(int(address[1], 16) - 0x4000)
        if "LD_A" in line:
            address += 1
            line = "".join(line.split("_LD_A"))
        elif "Missable" in line:
            address += 6
        elif "Event" in line or "Hidden_Item" in line:
            address += 2
        elif "_0" in line:
            line = "_0".join(line.split("_0")[:-1])
        elif "_10" in line:
            address += 10
            line = "".join(line.split("_10"))
        elif "_12" in line:
            address += 12
            line = "".join(line.split("_12"))
        elif "_1" in line:
            address += 1
            line = "".join(line.split("_1"))
        elif "_2" in line:
            address += 2
            line = "".join(line.split("_2"))
        elif "_4" in line:
            address += 4
            line = "".join(line.split("_4"))
        elif "_6" in line:
            address += 6
            line = "".join(line.split("_6"))
        elif "_8" in line:
            address += 8
            line = "".join(line.split("_8"))

        #file.write(hex(address) + ", #" + str(count) + "   "  + line.split("Archipelago_")[1] + "\n")
        file.write("    \"" + line.split("Archipelago_")[1] + "\": " + hex(address) + ",\n")
        #file.write(str(count) + ": \"" + line.split("Archipelago_")[1] + "\",")
        count += 1
    elif "_Object" in line:
        address = line.split(" ")[0]
        address = address.split(":")
        if int(address[0], 16) == 0:
            address = int(address[1], 16)
        else:
            address = (int(address[0], 16) * 0x4000) + int(int(address[1], 16) - 0x4000)
        address += 4
        file.write("    \"Warps_" + line.split("_")[0].split(" ")[1] + "\": " + hex(address) + ",\n")
    elif line.endswith("WarpMaps"):
        address = line.split(" ")[0]
        address = address.split(":")
        if int(address[0], 16) == 0:
            address = int(address[1], 16)
        else:
            address = (int(address[0], 16) * 0x4000) + int(int(address[1], 16) - 0x4000)
        file.write("    \"" + line.split(" ")[1] + "\": " + hex(address) + ",\n")


file.write("}\n")
file.close()


with open(pokered_addr + "pokeblue_orig.gbc", "br") as file:
    blue = bytes(file.read())
with open(pokered_addr + "pokered_orig.gbc", "br") as file:
    red = bytes(file.read())

with open(pokered_addr + "pokeblue.gbc", "br") as file:
    blueap = bytes(file.read())
with open(pokered_addr + "pokered.gbc", "br") as file:
    redap = bytes(file.read())


import bsdiff4
bluepatch = bsdiff4.diff(blue, blueap)
redpatch = bsdiff4.diff(red, redap)

with open(world_addr + "basepatch_blue.bsdiff4", "bw") as file:
    file.write(bluepatch)
with open(world_addr + "basepatch_red.bsdiff4", "bw") as file:
    file.write(redpatch)
