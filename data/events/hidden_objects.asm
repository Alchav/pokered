HiddenObjectMaps:
	dbw SILPH_CO_11F,                 SilphCo11FHiddenObjects
	dbw SILPH_CO_5F,                  SilphCo5FHiddenObjects
	dbw SILPH_CO_9F,                  SilphCo9FHiddenObjects
	dbw POKEMON_MANSION_2F,           Mansion2HiddenObjects
	dbw POKEMON_MANSION_3F,           Mansion3HiddenObjects
	dbw POKEMON_MANSION_B1F,          Mansion4HiddenObjects
	dbw SAFARI_ZONE_WEST,             SafariZoneWestHiddenObjects
	dbw CERULEAN_CAVE_2F,             CeruleanCave2HiddenObjects
	dbw CERULEAN_CAVE_B1F,            CeruleanCave3HiddenObjects
	dbw UNUSED_MAP_6F,                UnusedMap6FHiddenObjects
	dbw SEAFOAM_ISLANDS_B2F,          SeafoamIslands3HiddenObjects
	dbw SEAFOAM_ISLANDS_B3F,          SeafoamIslands4HiddenObjects
	dbw SEAFOAM_ISLANDS_B4F,          SeafoamIslands5HiddenObjects
	dbw VIRIDIAN_FOREST,              ViridianForestHiddenObjects
	dbw MT_MOON_B2F,                  MtMoon3HiddenObjects
	dbw SS_ANNE_B1F_ROOMS,            SSAnne10HiddenObjects
	dbw SS_ANNE_KITCHEN,              SSAnne6HiddenObjects
	dbw UNDERGROUND_PATH_NORTH_SOUTH, UndergroundPathNsHiddenObjects
	dbw UNDERGROUND_PATH_WEST_EAST,   UndergroundPathWeHiddenObjects
	dbw ROCKET_HIDEOUT_B1F,           RocketHideout1HiddenObjects
	dbw ROCKET_HIDEOUT_B3F,           RocketHideout3HiddenObjects
	dbw ROCKET_HIDEOUT_B4F,           RocketHideout4HiddenObjects
	dbw ROUTE_10,                     Route10HiddenObjects
	dbw ROCK_TUNNEL_POKECENTER,       RockTunnelPokecenterHiddenObjects
	dbw POWER_PLANT,                  PowerPlantHiddenObjects
	dbw ROUTE_11,                     Route11HiddenObjects
	dbw ROUTE_12,                     Route12HiddenObjects
	dbw ROUTE_13,                     Route13HiddenObjects
	dbw ROUTE_15_GATE_2F,             Route15Gate2FHiddenObjects
	dbw ROUTE_17,                     Route17HiddenObjects
	dbw ROUTE_23,                     Route23HiddenObjects
	dbw VICTORY_ROAD_2F,              VictoryRoad2HiddenObjects
	dbw ROUTE_25,                     Route25HiddenObjects
	dbw BILLS_HOUSE,                  BillsHouseHiddenObjects
	dbw ROUTE_4,                      Route4HiddenObjects
	dbw MT_MOON_POKECENTER,           MtMoonPokecenterHiddenObjects
	dbw ROUTE_9,                      Route9HiddenObjects
	dbw TRADE_CENTER,                 TradeCenterHiddenObjects
	dbw COLOSSEUM,                    ColosseumHiddenObjects
	dbw INDIGO_PLATEAU,               IndigoPlateauHiddenObjects
	dbw INDIGO_PLATEAU_LOBBY,         IndigoPlateauLobbyHiddenObjects
	dbw COPYCATS_HOUSE_2F,            CopycatsHouse2FHiddenObjects
	dbw FIGHTING_DOJO,                FightingDojoHiddenObjects
	dbw SAFFRON_GYM,                  SaffronGymHiddenObjects
	dbw SAFFRON_POKECENTER,           SaffronPokecenterHiddenObjects
	dbw REDS_HOUSE_2F,                RedsHouse2FHiddenObjects
	dbw BLUES_HOUSE,                  BluesHouseHiddenObjects
	dbw OAKS_LAB,                     OaksLabHiddenObjects
	dbw VIRIDIAN_CITY,                ViridianCityHiddenObjects
	dbw VIRIDIAN_POKECENTER,          ViridianPokecenterHiddenObjects
	dbw VIRIDIAN_SCHOOL_HOUSE,        ViridianSchoolHiddenObjects
	dbw VIRIDIAN_GYM,                 ViridianGymHiddenObjects
	dbw MUSEUM_1F,                    Museum1FHiddenObjects
	dbw PEWTER_GYM,                   PewterGymHiddenObjects
	dbw PEWTER_POKECENTER,            PewterPokecenterHiddenObjects
	dbw CERULEAN_CITY,                CeruleanCityHiddenObjects
	dbw CERULEAN_POKECENTER,          CeruleanPokecenterHiddenObjects
	dbw CERULEAN_GYM,                 CeruleanGymHiddenObjects
	dbw BIKE_SHOP,                    BikeShopHiddenObjects
	dbw CERULEAN_CAVE_1F,             CeruleanCave1HiddenObjects
	dbw LAVENDER_POKECENTER,          LavenderPokecenterHiddenObjects
	dbw POKEMON_TOWER_5F,             Pokemontower5HiddenObjects
	dbw MR_FUJIS_HOUSE,               LavenderHouse1HiddenObjects
	dbw VERMILION_CITY,               VermilionCityHiddenObjects
	dbw VERMILION_POKECENTER,         VermilionPokecenterHiddenObjects
	dbw POKEMON_FAN_CLUB,             PokemonFanClubHiddenObjects
	dbw VERMILION_GYM,                VermilionGymHiddenObjects
	dbw CELADON_CITY,                 CeladonCityHiddenObjects
	dbw CELADON_HOTEL,                CeladonHotelHiddenObjects
	dbw CELADON_MANSION_2F,           CeladonMansion2HiddenObjects
	dbw CELADON_MANSION_ROOF_HOUSE,   CeladonMansion5HiddenObjects
	dbw CELADON_POKECENTER,           CeladonPokecenterHiddenObjects
	dbw CELADON_GYM,                  CeladonGymHiddenObjects
	dbw GAME_CORNER,                  GameCornerHiddenObjects
	dbw FUCHSIA_POKECENTER,           FuchsiaPokecenterHiddenObjects
	dbw SAFARI_ZONE_GATE,             SafariZoneEntranceHiddenObjects
	dbw FUCHSIA_GYM,                  FuchsiaGymHiddenObjects
	dbw POKEMON_MANSION_1F,           Mansion1HiddenObjects
	dbw CINNABAR_GYM,                 CinnabarGymHiddenObjects
	dbw CINNABAR_LAB_FOSSIL_ROOM,     CinnabarLab4HiddenObjects
	dbw CINNABAR_POKECENTER,          CinnabarPokecenterHiddenObjects
	db -1 ; end

MACRO hidden_object
	db \2 ; y coord
	db \1 ; x coord
	db \3 ; item id
	dba \4 ; object routine
ENDM

MACRO hidden_text_predef
	db \2 ; y coord
	db \1 ; x coord
	db_tx_pre \3 ; text id
	dba \4 ; object routine
ENDM

; Some hidden objects use SPRITE_FACING_* values,
; but these do not actually prevent the player
; from interacting with them in any direction.
DEF ANY_FACING EQU $d0

SilphCo11FHiddenObjects:
	hidden_object 10, 12, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

SilphCo5FHiddenObjects:
.Archipelago_Hidden_Item_Silph_Co_5F
	hidden_object 12,  3, ELIXER, HiddenItems
	db -1 ; end

SilphCo9FHiddenObjects:
.Archipelago_Hidden_Item_Silph_Co_9F
	hidden_object  2, 15, MAX_POTION, HiddenItems
	db -1 ; end

Mansion2HiddenObjects:
	hidden_object  2, 11, SPRITE_FACING_UP, Mansion2Script_Switches
	db -1 ; end

Mansion3HiddenObjects:
.Archipelago_Hidden_Item_Pokemon_Mansion_3F
	hidden_object  1,  9, MAX_REVIVE, HiddenItems
	hidden_object 10,  5, SPRITE_FACING_UP, Mansion3Script_Switches
	db -1 ; end

Mansion4HiddenObjects:
.Archipelago_Hidden_Item_Pokemon_Mansion_B1F
	hidden_object  1,  9, RARE_CANDY, HiddenItems
	hidden_object 20,  3, SPRITE_FACING_UP, Mansion4Script_Switches
	hidden_object 18, 25, SPRITE_FACING_UP, Mansion4Script_Switches
	db -1 ; end

SafariZoneWestHiddenObjects:
.Archipelago_Hidden_Item_Safari_Zone_West
	hidden_object  6,  5, REVIVE, HiddenItems
	db -1 ; end

CeruleanCave2HiddenObjects:
.Archipelago_Hidden_Item_Cerulean_Cave_2F
	hidden_object 16, 13, PP_UP, HiddenItems
	db -1 ; end

CeruleanCave3HiddenObjects:
.Archipelago_Hidden_Item_Cerulean_Cave_B1F
	hidden_object  8, 14, PP_UP, HiddenItems
	db -1 ; end

UnusedMap6FHiddenObjects:
.Archipelago_Hidden_Item_Unused_6F
	hidden_object 14, 11, MAX_ELIXER, HiddenItems
	db -1 ; end

SeafoamIslands3HiddenObjects:
.Archipelago_Hidden_Item_Seafoam_Islands_B2F
	hidden_object 15, 15, NUGGET, HiddenItems
	db -1 ; end

SeafoamIslands4HiddenObjects:
.Archipelago_Hidden_Item_Seafoam_Islands_B3F
	hidden_object  9, 16, MAX_ELIXER, HiddenItems
	db -1 ; end

SeafoamIslands5HiddenObjects:
.Archipelago_Hidden_Item_Seafoam_Islands_B4F
	hidden_object 25, 17, ULTRA_BALL, HiddenItems
	db -1 ; end

ViridianForestHiddenObjects:
.Archipelago_Hidden_Item_Viridian_Forest_1
	hidden_object  1, 18, POTION, HiddenItems
.Archipelago_Hidden_Item_Viridian_Forest_2
	hidden_object 16, 42, ANTIDOTE, HiddenItems
	db -1 ; end

MtMoon3HiddenObjects:
.Archipelago_Hidden_Item_MtMoonB2F_1
	hidden_object 18, 12, MOON_STONE, HiddenItems
.Archipelago_Hidden_Item_MtMoonB2F_2
	hidden_object 33,  9, ETHER, HiddenItems
	db -1 ; end

SSAnne10HiddenObjects:
.Archipelago_Hidden_Item_SS_Anne_B1F
	hidden_object  3,  1, HYPER_POTION, HiddenItems
	db -1 ; end

SSAnne6HiddenObjects:
	hidden_object 13,  5, SPRITE_FACING_DOWN, PrintTrashText
	hidden_object 13,  7, SPRITE_FACING_DOWN, PrintTrashText
.Archipelago_Hidden_Item_SS_Anne_Kitchen
	hidden_object 13,  9, GREAT_BALL, HiddenItems
	db -1 ; end

UndergroundPathNsHiddenObjects:
.Archipelago_Hidden_Item_Underground_Path_NS_1
	hidden_object  3,  4, FULL_RESTORE, HiddenItems
.Archipelago_Hidden_Item_Underground_Path_NS_2
	hidden_object  4, 34, X_SPECIAL, HiddenItems
	db -1 ; end

UndergroundPathWeHiddenObjects:
.Archipelago_Hidden_Item_Underground_Path_WE_1
	hidden_object 12,  2, NUGGET, HiddenItems
.Archipelago_Hidden_Item_Underground_Path_WE_2
	hidden_object 21,  5, ELIXER, HiddenItems
	db -1 ; end

RocketHideout1HiddenObjects:
.Archipelago_Hidden_Item_Rocket_Hideout_B1F
	hidden_object 21, 15, PP_UP, HiddenItems
	db -1 ; end

RocketHideout3HiddenObjects:
.Archipelago_Hidden_Item_Rocket_Hideout_B3F
	hidden_object 27, 17, NUGGET, HiddenItems
	db -1 ; end

RocketHideout4HiddenObjects:
.Archipelago_Hidden_Item_Rocket_Hideout_B4F
	hidden_object 25,  1, SUPER_POTION, HiddenItems
	db -1 ; end

Route10HiddenObjects:
.Archipelago_Hidden_Item_Route_10_1
	hidden_object  9, 17, SUPER_POTION, HiddenItems
.Archipelago_Hidden_Item_Route_10_2
	hidden_object 16, 53, MAX_ETHER, HiddenItems
	db -1 ; end

RockTunnelPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

PowerPlantHiddenObjects:
.Archipelago_Hidden_Item_Power_Plant_1
	hidden_object 17, 16, MAX_ELIXER, HiddenItems
.Archipelago_Hidden_Item_Power_Plant_2
	hidden_object 12,  1, PP_UP, HiddenItems
	db -1 ; end

Route11HiddenObjects:
.Archipelago_Hidden_Item_Route_11
	hidden_object 48,  5, ESCAPE_ROPE, HiddenItems
	db -1 ; end

Route12HiddenObjects:
.Archipelago_Hidden_Item_Route_12
	hidden_object  2, 63, HYPER_POTION, HiddenItems
	db -1 ; end

Route13HiddenObjects:
.Archipelago_Hidden_Item_Route_13_1
	hidden_object  1, 14, PP_UP, HiddenItems
.Archipelago_Hidden_Item_Route_13_2
	hidden_object 16, 13, CALCIUM, HiddenItems
	db -1 ; end

Route15Gate2FHiddenObjects:
	hidden_object  1,  2, SPRITE_FACING_UP, Route15GateLeftBinoculars
	db -1 ; end

Route17HiddenObjects:
.Archipelago_Hidden_Item_Route_17_1
	hidden_object 15,  14, RARE_CANDY, HiddenItems
.Archipelago_Hidden_Item_Route_17_2
	hidden_object  8,  45, FULL_RESTORE, HiddenItems
.Archipelago_Hidden_Item_Route_17_3
	hidden_object 17,  72, PP_UP, HiddenItems
.Archipelago_Hidden_Item_Route_17_4
	hidden_object  4,  91, MAX_REVIVE, HiddenItems
.Archipelago_Hidden_Item_Route_17_5
	hidden_object  8, 121, MAX_ELIXER, HiddenItems
	db -1 ; end

Route23HiddenObjects:
.Archipelago_Hidden_Item_Route_23_1
	hidden_object  9, 44, FULL_RESTORE, HiddenItems
.Archipelago_Hidden_Item_Route_23_2
	hidden_object 19, 70, ULTRA_BALL, HiddenItems
.Archipelago_Hidden_Item_Route_23_3
	hidden_object  8, 90, MAX_ETHER, HiddenItems
	db -1 ; end

VictoryRoad2HiddenObjects:
.Archipelago_Hidden_Item_Victory_Road_2F_1
	hidden_object  5,  2, ULTRA_BALL, HiddenItems
.Archipelago_Hidden_Item_Victory_Road_2F_2
	hidden_object 26,  7, FULL_RESTORE, HiddenItems
	db -1 ; end

Route25HiddenObjects:
.Archipelago_Hidden_Item_Route_25_1
	hidden_object 38,  3, ETHER, HiddenItems
.Archipelago_Hidden_Item_Route_25_2
	hidden_object 10,  1, ELIXER, HiddenItems
	db -1 ; end

BillsHouseHiddenObjects:
	hidden_object  1,  4, SPRITE_FACING_UP, BillsHousePC
	db -1 ; end

Route4HiddenObjects:
.Archipelago_Hidden_Item_Route_4
	hidden_object 40,  3, GREAT_BALL, HiddenItems
	db -1 ; end

MtMoonPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

Route9HiddenObjects:
.Archipelago_Hidden_Item_Route_9
	hidden_object 14,  7, ETHER, HiddenItems
	db -1 ; end

TradeCenterHiddenObjects:
	hidden_object  5,  4, ANY_FACING, CableClubRightGameboy
	hidden_object  4,  4, ANY_FACING, CableClubLeftGameboy
	db -1 ; end

ColosseumHiddenObjects:
	hidden_object  5,  4, ANY_FACING, CableClubRightGameboy
	hidden_object  4,  4, ANY_FACING, CableClubLeftGameboy
	db -1 ; end

IndigoPlateauHiddenObjects:
	hidden_object  8, 13, $ff, PrintIndigoPlateauHQText ; inaccessible
	hidden_object 11, 13, SPRITE_FACING_DOWN, PrintIndigoPlateauHQText ; inaccessible
	db -1 ; end

IndigoPlateauLobbyHiddenObjects:
	hidden_object 15,  7, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CopycatsHouse2FHiddenObjects:
.Archipelago_Hidden_Item_Copycats_House
	hidden_object  1,  1, NUGGET, HiddenItems
	db -1 ; end

FightingDojoHiddenObjects:
	hidden_object  3,  9, SPRITE_FACING_UP, PrintFightingDojoText
	hidden_object  6,  9, SPRITE_FACING_UP, PrintFightingDojoText
	hidden_object  4,  0, SPRITE_FACING_UP, PrintFightingDojoText2
	hidden_object  5,  0, SPRITE_FACING_UP, PrintFightingDojoText3
	db -1 ; end

SaffronGymHiddenObjects:
	hidden_object  9, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

SaffronPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

RedsHouse2FHiddenObjects:
	hidden_object  0,  1, SPRITE_FACING_UP, OpenRedsPC
	hidden_object  3,  5, ANY_FACING, PrintRedSNESText
	db -1 ; end

BluesHouseHiddenObjects:
	hidden_object  0,  1, SPRITE_FACING_UP, PrintBookcaseText
	hidden_object  1,  1, SPRITE_FACING_UP, PrintBookcaseText
	hidden_object  7,  1, SPRITE_FACING_UP, PrintBookcaseText
	db -1 ; end

OaksLabHiddenObjects:
	hidden_object  4,  0, SPRITE_FACING_UP, DisplayOakLabLeftPoster
	hidden_object  5,  0, SPRITE_FACING_UP, DisplayOakLabRightPoster
	hidden_object  0,  1, SPRITE_FACING_UP, DisplayOakLabEmailText
	hidden_object  1,  1, SPRITE_FACING_UP, DisplayOakLabEmailText
	db -1 ; end

ViridianCityHiddenObjects:
.Archipelago_Hidden_Item_Viridian_City
	hidden_object 14,  4, POTION, HiddenItems
	db -1 ; end

ViridianPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

ViridianSchoolHiddenObjects:
	hidden_text_predef  3,  4, ViridianSchoolNotebook, PrintNotebookText
	hidden_text_predef  3,  0, ViridianSchoolBlackboard, PrintBlackboardLinkCableText
	db -1 ; end

ViridianGymHiddenObjects:
	hidden_object 15, 15, SPRITE_FACING_UP, GymStatues
	hidden_object 18, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

Museum1FHiddenObjects:
	hidden_object  2,  3, SPRITE_FACING_UP, AerodactylFossil
	hidden_object  2,  6, SPRITE_FACING_UP, KabutopsFossil
	db -1 ; end

PewterGymHiddenObjects:
	hidden_object  3, 10, SPRITE_FACING_UP, GymStatues
	hidden_object  6, 10, SPRITE_FACING_UP, GymStatues
	db -1 ; end

PewterPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeruleanCityHiddenObjects:
.Archipelago_Hidden_Item_Cerulean_City
	hidden_object 15,  8, RARE_CANDY, HiddenItems
	db -1 ; end

CeruleanPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeruleanGymHiddenObjects:
	hidden_object  3, 11, SPRITE_FACING_UP, GymStatues
	hidden_object  6, 11, SPRITE_FACING_UP, GymStatues
	db -1 ; end

BikeShopHiddenObjects:
	hidden_object  1,  0, ANY_FACING, PrintNewBikeText
	hidden_object  2,  1, ANY_FACING, PrintNewBikeText
	hidden_object  1,  2, ANY_FACING, PrintNewBikeText
	hidden_object  3,  2, ANY_FACING, PrintNewBikeText
	hidden_object  0,  4, ANY_FACING, PrintNewBikeText
	hidden_object  1,  5, ANY_FACING, PrintNewBikeText
	db -1 ; end

CeruleanCave1HiddenObjects:
.Archipelago_Hidden_Item_Cerulean_Cave_1F
	hidden_object 18,  7, PP_UP, HiddenItems
	db -1 ; end

LavenderPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

Pokemontower5HiddenObjects:
.Archipelago_Hidden_Item_Pokemon_Tower_5F
	hidden_object  4, 12, ELIXER, HiddenItems
	db -1 ; end

LavenderHouse1HiddenObjects:
	hidden_object  0,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	hidden_object  1,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	hidden_object  7,  1, SPRITE_FACING_DOWN, PrintMagazinesText
	db -1 ; end

VermilionCityHiddenObjects:
.Archipelago_Hidden_Item_Vermilion_City
	hidden_object 14, 11, MAX_ETHER, HiddenItems
	db -1 ; end

VermilionPokecenterHiddenObjects:
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_object  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	db -1 ; end

PokemonFanClubHiddenObjects:
	hidden_object  1,  0, SPRITE_FACING_UP, FanClubPicture1
	hidden_object  6,  0, SPRITE_FACING_UP, FanClubPicture2
	db -1 ; end

VermilionGymHiddenObjects:
	hidden_object  3, 14, SPRITE_FACING_UP, GymStatues
	hidden_object  6, 14, SPRITE_FACING_UP, GymStatues
	hidden_object  6,  1, SPRITE_FACING_DOWN, PrintTrashText
	; third param: [wGymTrashCanIndex]
	hidden_object  1,  7,  0, GymTrashScript
	hidden_object  1,  9,  1, GymTrashScript
	hidden_object  1, 11,  2, GymTrashScript
	hidden_object  3,  7,  3, GymTrashScript
	hidden_object  3,  9,  4, GymTrashScript
	hidden_object  3, 11,  5, GymTrashScript
	hidden_object  5,  7,  6, GymTrashScript
	hidden_object  5,  9,  7, GymTrashScript
	hidden_object  5, 11,  8, GymTrashScript
	hidden_object  7,  7,  9, GymTrashScript
	hidden_object  7,  9, 10, GymTrashScript
	hidden_object  7, 11, 11, GymTrashScript
	hidden_object  9,  7, 12, GymTrashScript
	hidden_object  9,  9, 13, GymTrashScript
	hidden_object  9, 11, 14, GymTrashScript
	db -1 ; end

CeladonCityHiddenObjects:
.Archipelago_Hidden_Item_Celadon_City
	hidden_object 48, 15, PP_UP, HiddenItems
	db -1 ; end

CeladonHotelHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	db -1 ; end

CeladonMansion2HiddenObjects:
	hidden_object  0,  5, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeladonMansion5HiddenObjects:
	hidden_text_predef  3,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  4,  0, LinkCableHelp, PrintBlackboardLinkCableText
	hidden_text_predef  3,  4, TMNotebook, PrintNotebookText
	db -1 ; end

CeladonPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_LEFT, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CeladonGymHiddenObjects:
	hidden_object  3, 15, SPRITE_FACING_UP, GymStatues
	hidden_object  6, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

GameCornerHiddenObjects:
	hidden_object 18, 15, ANY_FACING, StartSlotMachine
	hidden_object 18, 14, ANY_FACING, StartSlotMachine
	hidden_object 18, 13, ANY_FACING, StartSlotMachine
	hidden_object 18, 12, ANY_FACING, StartSlotMachine
	hidden_object 18, 11, ANY_FACING, StartSlotMachine
	hidden_object 18, 10, SLOTS_SOMEONESKEYS, StartSlotMachine
	hidden_object 13, 10, ANY_FACING, StartSlotMachine
	hidden_object 13, 11, ANY_FACING, StartSlotMachine
	hidden_object 13, 12, SLOTS_OUTTOLUNCH, StartSlotMachine
	hidden_object 13, 13, ANY_FACING, StartSlotMachine
	hidden_object 13, 14, ANY_FACING, StartSlotMachine
	hidden_object 13, 15, ANY_FACING, StartSlotMachine
	hidden_object 12, 15, ANY_FACING, StartSlotMachine
	hidden_object 12, 14, ANY_FACING, StartSlotMachine
	hidden_object 12, 13, ANY_FACING, StartSlotMachine
	hidden_object 12, 12, ANY_FACING, StartSlotMachine
	hidden_object 12, 11, ANY_FACING, StartSlotMachine
	hidden_object 12, 10, ANY_FACING, StartSlotMachine
	hidden_object  7, 10, ANY_FACING, StartSlotMachine
	hidden_object  7, 11, ANY_FACING, StartSlotMachine
	hidden_object  7, 12, ANY_FACING, StartSlotMachine
	hidden_object  7, 13, ANY_FACING, StartSlotMachine
	hidden_object  7, 14, ANY_FACING, StartSlotMachine
	hidden_object  7, 15, ANY_FACING, StartSlotMachine
	hidden_object  6, 15, ANY_FACING, StartSlotMachine
	hidden_object  6, 14, ANY_FACING, StartSlotMachine
	hidden_object  6, 13, ANY_FACING, StartSlotMachine
	hidden_object  6, 12, SLOTS_OUTOFORDER, StartSlotMachine
	hidden_object  6, 11, ANY_FACING, StartSlotMachine
	hidden_object  6, 10, ANY_FACING, StartSlotMachine
	hidden_object  1, 10, ANY_FACING, StartSlotMachine
	hidden_object  1, 11, ANY_FACING, StartSlotMachine
	hidden_object  1, 12, ANY_FACING, StartSlotMachine
	hidden_object  1, 13, ANY_FACING, StartSlotMachine
	hidden_object  1, 14, ANY_FACING, StartSlotMachine
	hidden_object  1, 15, ANY_FACING, StartSlotMachine
.Archipelago_Hidden_Item_Game_Corner_1
	hidden_object  0,  8, TEN_COINS, HiddenItems
.Archipelago_Hidden_Item_Game_Corner_2
	hidden_object  1, 16, TEN_COINS, HiddenItems
.Archipelago_Hidden_Item_Game_Corner_3
	hidden_object  3, 11, TWENTY_COINS, HiddenItems
.Archipelago_Hidden_Item_Game_Corner_4
	hidden_object  3, 14, TEN_COINS, HiddenItems
.Archipelago_Hidden_Item_Game_Corner_5
	hidden_object  4, 12, TEN_COINS, HiddenItems
.Archipelago_Hidden_Item_Game_Corner_6
	hidden_object  9, 12, TWENTY_COINS, HiddenItems
.Archipelago_Hidden_Item_Game_Corner_7
	hidden_object  9, 15, TEN_COINS, HiddenItems
.Archipelago_Hidden_Item_Game_Corner_8
	hidden_object 16, 14, TEN_COINS, HiddenItems
.Archipelago_Hidden_Item_Game_Corner_9
	hidden_object 10, 16, TEN_COINS, HiddenItems
.Archipelago_Hidden_Item_Game_Corner_10
	hidden_object 11,  7, TWENTY_COINS, HiddenItems
.Archipelago_Hidden_Item_Game_Corner_11
	hidden_object 15,  8, HUNDRED_COINS, HiddenItems
	db -1 ; end

FuchsiaPokecenterHiddenObjects:
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_object  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	db -1 ; end

SafariZoneEntranceHiddenObjects:
	hidden_object 10,  1, NUGGET, HiddenItems ; inaccessible
	db -1 ; end

FuchsiaGymHiddenObjects:
	hidden_object  3, 15, SPRITE_FACING_UP, GymStatues
	hidden_object  6, 15, SPRITE_FACING_UP, GymStatues
	db -1 ; end

Mansion1HiddenObjects:
.Archipelago_Hidden_Item_Pokemon_Mansion_1F
	hidden_object  8, 16, MOON_STONE, HiddenItems
	hidden_object  2,  5, SPRITE_FACING_UP, Mansion1Script_Switches
	db -1 ; end

CinnabarGymHiddenObjects:
	hidden_object 17, 13, SPRITE_FACING_UP, GymStatues
	; third param: ([hGymGateAnswer] << 4) | [hGymGateIndex]
.Archipelago_Quiz_Answer_A_2
	hidden_object 15,  7, (FALSE << 4) | 1, PrintCinnabarQuiz
.Archipelago_Quiz_Answer_B_2
	hidden_object 10,  1, (TRUE  << 4) | 2, PrintCinnabarQuiz
.Archipelago_Quiz_Answer_C_2
	hidden_object  9,  7, (TRUE  << 4) | 3, PrintCinnabarQuiz
.Archipelago_Quiz_Answer_D_2
	hidden_object  9, 13, (TRUE  << 4) | 4, PrintCinnabarQuiz
.Archipelago_Quiz_Answer_E_2
	hidden_object  1, 13, (FALSE << 4) | 5, PrintCinnabarQuiz
.Archipelago_Quiz_Answer_F_2
	hidden_object  1,  7, (TRUE  << 4) | 6, PrintCinnabarQuiz
	db -1 ; end

CinnabarLab4HiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_UP, OpenPokemonCenterPC
	hidden_object  2,  4, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end

CinnabarPokecenterHiddenObjects:
	hidden_object  0,  4, SPRITE_FACING_UP, PrintBenchGuyText
	hidden_object 13,  3, SPRITE_FACING_UP, OpenPokemonCenterPC
	db -1 ; end
