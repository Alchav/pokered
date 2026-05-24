TrainerDataPointers:
	dw YoungsterData
	dw BugCatcherData
	dw LassData
	dw SailorData
	dw JrTrainerMData
	dw JrTrainerFData
	dw PokemaniacData
	dw SuperNerdData
	dw HikerData
	dw BikerData
	dw BurglarData
	dw EngineerData
	dw UnusedJugglerData
	dw FisherData
	dw SwimmerData
	dw CueBallData
	dw GamblerData
	dw BeautyData
	dw PsychicData
	dw RockerData
	dw JugglerData
	dw TamerData
	dw BirdKeeperData
	dw BlackbeltData
	dw Rival1Data
	dw ProfOakData
	dw ChiefData
	dw ScientistData
	dw GiovanniData
	dw RocketData
	dw CooltrainerMData
	dw CooltrainerFData
	dw BrunoData
	dw BrockData
	dw MistyData
	dw LtSurgeData
	dw ErikaData
	dw KogaData
	dw BlaineData
	dw SabrinaData
	dw GentlemanData
	dw Rival2Data
	dw Rival3Data
	dw LoreleiData
	dw ChannelerData
	dw AgathaData
	dw LanceData

; if first byte != $FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == $FF, then
	; first byte is $FF (obviously)
	; every next two bytes are a level and species
	; null-terminated

YoungsterData:
; Route 3
.Archipelago_Trainer_Party_Route_3_Youngster_A_0
	db 11, RATTATA, EKANS, 0
.Archipelago_Trainer_Party_Route_3_Youngster_B_0
	db 14, SPEAROW, 0
; Mt. Moon 1F
.Archipelago_Trainer_Party_Mt_Moon_1F_Youngster_A_0
	db 10, RATTATA, RATTATA, ZUBAT, 0
; Route 24
.Archipelago_Trainer_Party_Route_24_Youngster_A_0
	db 14, RATTATA, EKANS, ZUBAT, 0
; Route 25
.Archipelago_Trainer_Party_Route_25_Youngster_A_0
	db 15, RATTATA, SPEAROW, 0
.Archipelago_Trainer_Party_Route_25_Youngster_B_0
	db 17, SLOWPOKE, 0
.Archipelago_Trainer_Party_Route_25_Youngster_C_0
	db 14, EKANS, SANDSHREW, 0
; SS Anne 1F Rooms
.Archipelago_Trainer_Party_SS_Anne_1F_Rooms_Youngster_A_0
	db 21, NIDORAN_M, 0
; Route 11
.Archipelago_Trainer_Party_Route_11_Youngster_A_0
	db 21, EKANS, 0
.Archipelago_Trainer_Party_Route_11_Youngster_B_0
	db 19, SANDSHREW, ZUBAT, 0
.Archipelago_Trainer_Party_Route_11_Youngster_C_0
	db 17, RATTATA, RATTATA, RATICATE, 0
.Archipelago_Trainer_Party_Route_11_Youngster_D_0
	db 18, NIDORAN_M, NIDORINO, 0
; Unused
	db 17, SPEAROW, RATTATA, RATTATA, SPEAROW, 0
	db 24, SANDSHREW, 0

BugCatcherData:
; Viridian Forest
.Archipelago_Trainer_Party_Viridian_Forest_BugCatcher_A_0
	db 7, CATERPIE, CATERPIE, 0
.Archipelago_Trainer_Party_Viridian_Forest_BugCatcher_B_0
	db 6, METAPOD, CATERPIE, METAPOD, 0
.Archipelago_Trainer_Party_Viridian_Forest_BugCatcher_C_0
	db 10, CATERPIE, 0
; Route 3
.Archipelago_Trainer_Party_Route_3_BugCatcher_A_0
	db 10, CATERPIE, WEEDLE, CATERPIE, 0
.Archipelago_Trainer_Party_Route_3_BugCatcher_B_0
	db 9, WEEDLE, KAKUNA, CATERPIE, METAPOD, 0
.Archipelago_Trainer_Party_Route_3_BugCatcher_C_0
	db 11, CATERPIE, METAPOD, 0
; Mt. Moon 1F
.Archipelago_Trainer_Party_Mt_Moon_1F_BugCatcher_A_0
	db 11, WEEDLE, KAKUNA, 0
.Archipelago_Trainer_Party_Mt_Moon_1F_BugCatcher_B_0
	db 10, CATERPIE, METAPOD, CATERPIE, 0
; Route 24
.Archipelago_Trainer_Party_Route_24_BugCatcher_A_0
	db 14, CATERPIE, WEEDLE, 0
; Route 6
.Archipelago_Trainer_Party_Route_6_BugCatcher_A_0
	db 16, WEEDLE, CATERPIE, WEEDLE, 0
.Archipelago_Trainer_Party_Route_6_BugCatcher_B_0
	db 20, BUTTERFREE, 0
; Unused
	db 18, METAPOD, CATERPIE, VENONAT, 0
; Route 9
.Archipelago_Trainer_Party_Route_9_BugCatcher_A_0
	db 19, BEEDRILL, BEEDRILL, 0
.Archipelago_Trainer_Party_Route_9_BugCatcher_B_0
	db 20, CATERPIE, WEEDLE, VENONAT, 0
.Archipelago_Trainer_Party_Viridian_Forest_BugCatcher_D_0
	db 8, CATERPIE, METAPOD, 0

LassData:
; Route 3
.Archipelago_Trainer_Party_Route_3_Lass_A_0
	db 9, PIDGEY, PIDGEY, 0
.Archipelago_Trainer_Party_Route_3_Lass_B_0
	db 10, RATTATA, NIDORAN_M, 0
.Archipelago_Trainer_Party_Route_3_Lass_C_0
	db 14, JIGGLYPUFF, 0
; Route 4
.Archipelago_Trainer_Party_Route_4_Lass_A_0
	db 31, PARAS, PARAS, PARASECT, 0
; Mt. Moon 1F
.Archipelago_Trainer_Party_Mt_Moon_1F_Lass_A_0
	db 11, ODDISH, BELLSPROUT, 0
.Archipelago_Trainer_Party_Mt_Moon_1F_Lass_B_0
	db 14, CLEFAIRY, 0
; Route 24
.Archipelago_Trainer_Party_Route_24_Lass_A_0
	db 16, PIDGEY, NIDORAN_F, 0
.Archipelago_Trainer_Party_Route_24_Lass_B_0
	db 14, PIDGEY, NIDORAN_F, 0
; Route 25
.Archipelago_Trainer_Party_Route_25_Lass_A_0
	db 15, NIDORAN_M, NIDORAN_F, 0
.Archipelago_Trainer_Party_Route_25_Lass_B_0
	db 13, ODDISH, PIDGEY, ODDISH, 0
; SS Anne 1F Rooms
.Archipelago_Trainer_Party_SS_Anne_1F_Rooms_Lass_A_0
	db 18, PIDGEY, NIDORAN_F, 0
; SS Anne 2F Rooms
.Archipelago_Trainer_Party_SS_Anne_2F_Rooms_Lass_A_0
	db 20, JIGGLYPUFF, 0
; Route 8
.Archipelago_Trainer_Party_Route_8_Lass_A_0
	db 23, NIDORAN_F, NIDORINA, 0
.Archipelago_Trainer_Party_Route_8_Lass_B_0
	db 24, MEOWTH, MEOWTH, MEOWTH, 0
.Archipelago_Trainer_Party_Route_8_Lass_C_0
	db 19, PIDGEY, RATTATA, NIDORAN_F, MEOWTH, NIDORAN_M, 0
.Archipelago_Trainer_Party_Route_8_Lass_D_0
	db 22, CLEFAIRY, CLEFAIRY, 0
; Celadon Gym
.Archipelago_Trainer_Party_Celadon_Gym_Lass_A_0
	db 23, BELLSPROUT, WEEPINBELL, 0
.Archipelago_Trainer_Party_Celadon_Gym_Lass_B_0
	db 23, ODDISH, GLOOM, 0
.Archipelago_Trainer_Party_Viridian_Forest_Lass_A_0
	db 6, NIDORAN_F, NIDORAN_M, 0

SailorData:
; SS Anne Stern
.Archipelago_Trainer_Party_SS_Anne_Stern_Sailor_A_0
	db 18, MACHOP, SHELLDER, 0
.Archipelago_Trainer_Party_SS_Anne_Stern_Sailor_B_0
	db 17, MACHOP, TENTACOOL, 0
; SS Anne B1F Rooms
.Archipelago_Trainer_Party_SS_Anne_B1F_Rooms_Sailor_A_0
	db 21, SHELLDER, 0
.Archipelago_Trainer_Party_SS_Anne_B1F_Rooms_Sailor_B_0
	db 17, HORSEA, SHELLDER, TENTACOOL, 0
.Archipelago_Trainer_Party_SS_Anne_B1F_Rooms_Sailor_C_0
	db 18, TENTACOOL, STARYU, 0
.Archipelago_Trainer_Party_SS_Anne_B1F_Rooms_Sailor_D_0
	db 17, HORSEA, HORSEA, HORSEA, 0
.Archipelago_Trainer_Party_SS_Anne_B1F_Rooms_Sailor_E_0
	db 20, MACHOP, 0
; Vermilion Gym
.Archipelago_Trainer_Party_Vermilion_Gym_Sailor_A_0
	db 24, MAGNEMITE, 0

JrTrainerMData:
; Pewter Gym
.Archipelago_Trainer_Party_Pewter_Gym_JrTrainerM_A_0
	db 9, DIGLETT, SANDSHREW, 0
; Route 24
.Archipelago_Trainer_Party_Route_24_JrTrainerM_A_0
	db 14, RATTATA, EKANS, 0
; Route 24
.Archipelago_Trainer_Party_Route_24_JrTrainerM_C_0
	db 18, MANKEY, 0
; Route 6
.Archipelago_Trainer_Party_Route_6_JrTrainerM_A_0
	db 20, SQUIRTLE, 0
.Archipelago_Trainer_Party_Route_6_JrTrainerM_B_0
	db 16, SPEAROW, RATICATE, 0
; Route 25
.Archipelago_Trainer_Party_Route_25_JrTrainerM_A_0
	db 14, RATTATA, EKANS, 0
; Route 9
.Archipelago_Trainer_Party_Route_9_JrTrainerM_A_0
	db 21, GROWLITHE, CHARMANDER, 0
.Archipelago_Trainer_Party_Route_9_JrTrainerM_B_0
	db 19, RATTATA, DIGLETT, EKANS, SANDSHREW, 0
; Route 12
.Archipelago_Trainer_Party_Route_12_JrTrainerM_A_0
	db 29, NIDORAN_M, NIDORINO, 0
	db 16, WEEPINBELL, 0

JrTrainerFData:
; Cerulean Gym
.Archipelago_Trainer_Party_Cerulean_Gym_JrTrainerF_A_0
	db 19, GOLDEEN, 0
; Route 6
.Archipelago_Trainer_Party_Route_6_JrTrainerF_A_0
	db 16, ODDISH, BELLSPROUT, 0
.Archipelago_Trainer_Party_Route_6_JrTrainerF_B_0
	db 16, PIDGEY, PIDGEY, PIDGEY, 0
; Unused
	db 22, BULBASAUR, 0
; Route 9
.Archipelago_Trainer_Party_Route_9_JrTrainerF_A_0
	db 18, ODDISH, BELLSPROUT, ODDISH, BELLSPROUT, 0
.Archipelago_Trainer_Party_Route_9_JrTrainerF_B_0
	db 23, MEOWTH, 0
; Route 10
.Archipelago_Trainer_Party_Route_10_JrTrainerF_A_0
	db 20, JIGGLYPUFF, CLEFAIRY, 0
.Archipelago_Trainer_Party_Route_10_JrTrainerF_B_0
	db 21, PIDGEY, PIDGEOTTO, 0
; Rock Tunnel B1F
.Archipelago_Trainer_Party_Rock_Tunnel_B1F_JrTrainerF_A_0
	db 21, JIGGLYPUFF, PIDGEY, MEOWTH, 0
.Archipelago_Trainer_Party_Rock_Tunnel_B1F_JrTrainerF_B_0
	db 22, ODDISH, BULBASAUR, 0
; Celadon Gym
.Archipelago_Trainer_Party_Celadon_Gym_JrTrainerF_A_0
	db 24, BULBASAUR, IVYSAUR, 0
; Route 13
.Archipelago_Trainer_Party_Route_13_JrTrainerF_A_0
	db 24, PIDGEY, MEOWTH, RATTATA, PIDGEY, MEOWTH, 0
.Archipelago_Trainer_Party_Route_13_JrTrainerF_B_0
	db 30, POLIWAG, POLIWAG, 0
.Archipelago_Trainer_Party_Route_13_JrTrainerF_C_0
	db 27, PIDGEY, MEOWTH, PIDGEY, PIDGEOTTO, 0
.Archipelago_Trainer_Party_Route_13_JrTrainerF_D_0
	db 28, GOLDEEN, POLIWAG, HORSEA, 0
; Route 20
.Archipelago_Trainer_Party_Route_20_JrTrainerF_A_0
	db 31, GOLDEEN, SEAKING, 0
; Rock Tunnel 1F
.Archipelago_Trainer_Party_Rock_Tunnel_1F_JrTrainerF_A_0
	db 22, BELLSPROUT, CLEFAIRY, 0
.Archipelago_Trainer_Party_Rock_Tunnel_1F_JrTrainerF_B_0
	db 20, MEOWTH, ODDISH, PIDGEY, 0
.Archipelago_Trainer_Party_Rock_Tunnel_1F_JrTrainerF_C_0
	db 19, PIDGEY, RATTATA, RATTATA, BELLSPROUT, 0
; Route 15
.Archipelago_Trainer_Party_Route_15_JrTrainerF_A_0
	db 28, GLOOM, ODDISH, ODDISH, 0
.Archipelago_Trainer_Party_Route_15_JrTrainerF_B_0
	db 29, PIDGEY, PIDGEOTTO, 0
.Archipelago_Trainer_Party_Route_15_JrTrainerF_C_0
	db 33, CLEFAIRY, 0
.Archipelago_Trainer_Party_Route_15_JrTrainerF_D_0
	db 29, BELLSPROUT, ODDISH, TANGELA, 0
; Route 20
.Archipelago_Trainer_Party_Route_20_JrTrainerF_C_0
	db 30, TENTACOOL, HORSEA, SEEL, 0
	db 20, CUBONE, 0

PokemaniacData:
; Route 10
.Archipelago_Trainer_Party_Route_10_Pokemaniac_A_0
	db 30, RHYHORN, LICKITUNG, 0
.Archipelago_Trainer_Party_Route_10_Pokemaniac_B_0
	db 20, CUBONE, SLOWPOKE, 0
; Rock Tunnel B1F
.Archipelago_Trainer_Party_Rock_Tunnel_B1F_Pokemaniac_A_0
	db 20, SLOWPOKE, SLOWPOKE, SLOWPOKE, 0
.Archipelago_Trainer_Party_Rock_Tunnel_B1F_Pokemaniac_B_0
	db 22, CHARMANDER, CUBONE, 0
.Archipelago_Trainer_Party_Rock_Tunnel_B1F_Pokemaniac_C_0
	db 25, SLOWPOKE, 0
; Victory Road 2F
.Archipelago_Trainer_Party_Victory_Road_2F_Pokemaniac_A_0
	db 40, CHARMELEON, LAPRAS, LICKITUNG, 0
; Rock Tunnel 1F
.Archipelago_Trainer_Party_Rock_Tunnel_1F_Pokemaniac_A_0
	db 23, CUBONE, SLOWPOKE, 0

SuperNerdData:
; Mt. Moon 1F
.Archipelago_Trainer_Party_Mt_Moon_1F_SuperNerd_A_0
	db 11, MAGNEMITE, VOLTORB, 0
; Mt. Moon B2F
.Archipelago_Trainer_Party_Mt_Moon_B2F_SuperNerd_A_0
	db 12, GRIMER, VOLTORB, KOFFING, 0
; Route 8
.Archipelago_Trainer_Party_Route_8_SuperNerd_A_0
	db 20, VOLTORB, KOFFING, VOLTORB, MAGNEMITE, 0
.Archipelago_Trainer_Party_Route_8_SuperNerd_B_0
	db 22, GRIMER, MUK, GRIMER, 0
.Archipelago_Trainer_Party_Route_8_SuperNerd_C_0
	db 26, KOFFING, 0
; Unused
	db 22, KOFFING, MAGNEMITE, WEEZING, 0
	db 20, MAGNEMITE, MAGNEMITE, KOFFING, MAGNEMITE, 0
	db 24, MAGNEMITE, VOLTORB, 0
; Cinnabar Gym
.Archipelago_Trainer_Party_Cinnabar_Gym_SuperNerd_A_0
	db 36, VULPIX, VULPIX, NINETALES, 0
.Archipelago_Trainer_Party_Cinnabar_Gym_SuperNerd_B_0
	db 34, PONYTA, CHARMANDER, VULPIX, GROWLITHE, 0
.Archipelago_Trainer_Party_Cinnabar_Gym_SuperNerd_C_0
	db 41, RAPIDASH, 0
.Archipelago_Trainer_Party_Cinnabar_Gym_SuperNerd_D_0
	db 37, GROWLITHE, VULPIX, 0

HikerData:
; Mt. Moon 1F
.Archipelago_Trainer_Party_Mt_Moon_1F_Hiker_A_0
	db 10, GEODUDE, GEODUDE, ONIX, 0
; Route 25
.Archipelago_Trainer_Party_Route_25_Hiker_A_0
	db 15, MACHOP, GEODUDE, 0
.Archipelago_Trainer_Party_Route_25_Hiker_B_0
	db 13, GEODUDE, GEODUDE, MACHOP, GEODUDE, 0
.Archipelago_Trainer_Party_Route_25_Hiker_C_0
	db 17, ONIX, 0
; Route 9
.Archipelago_Trainer_Party_Route_9_Hiker_A_0
	db 21, GEODUDE, ONIX, 0
.Archipelago_Trainer_Party_Route_9_Hiker_B_0
	db 20, GEODUDE, MACHOP, GEODUDE, 0
; Route 10
.Archipelago_Trainer_Party_Route_10_Hiker_A_0
	db 21, GEODUDE, ONIX, 0
.Archipelago_Trainer_Party_Route_10_Hiker_B_0
	db 19, ONIX, GRAVELER, 0
; Rock Tunnel B1F
.Archipelago_Trainer_Party_Rock_Tunnel_B1F_Hiker_A_0
	db 21, GEODUDE, GEODUDE, GRAVELER, 0
.Archipelago_Trainer_Party_Rock_Tunnel_B1F_Hiker_B_0
	db 25, GEODUDE, 0
; Route 9
.Archipelago_Trainer_Party_Route_9_Hiker_D_0
	db 20, MACHOP, ONIX, 0
; Rock Tunnel 1F
.Archipelago_Trainer_Party_Rock_Tunnel_1F_Hiker_A_0
	db 19, GEODUDE, MACHOP, GEODUDE, GEODUDE, 0
.Archipelago_Trainer_Party_Rock_Tunnel_1F_Hiker_B_0
	db 20, ONIX, ONIX, GEODUDE, 0
.Archipelago_Trainer_Party_Rock_Tunnel_1F_Hiker_C_0
	db 21, GEODUDE, GRAVELER, 0

; Rock Tunnel B1F
.Archipelago_Trainer_Party_Rock_Tunnel_B1F_Hiker_D_0
	db 20, MACHOP, ONIX, 0

BikerData:
; Route 13
.Archipelago_Trainer_Party_Route_13_Biker_A_0
	db 28, KOFFING, KOFFING, KOFFING, 0
; Route 14
.Archipelago_Trainer_Party_Route_14_Biker_A_0
	db 29, KOFFING, GRIMER, 0
; Route 15
.Archipelago_Trainer_Party_Route_15_Biker_A_0
	db 25, KOFFING, KOFFING, WEEZING, KOFFING, GRIMER, 0
.Archipelago_Trainer_Party_Route_15_Biker_B_0
	db 28, KOFFING, GRIMER, WEEZING, 0
; Route 16
.Archipelago_Trainer_Party_Route_16_Biker_A_0
	db 29, GRIMER, KOFFING, 0
.Archipelago_Trainer_Party_Route_16_Biker_B_0
	db 33, WEEZING, 0
.Archipelago_Trainer_Party_Route_16_Biker_C_0
	db 26, GRIMER, GRIMER, GRIMER, GRIMER, 0
; Route 17
.Archipelago_Trainer_Party_Route_17_Biker_A_0
	db 28, WEEZING, KOFFING, WEEZING, 0
.Archipelago_Trainer_Party_Route_17_Biker_B_0
	db 33, MUK, 0
.Archipelago_Trainer_Party_Route_17_Biker_C_0
	db 29, VOLTORB, VOLTORB, 0
.Archipelago_Trainer_Party_Route_17_Biker_D_0
	db 29, WEEZING, MUK, 0
.Archipelago_Trainer_Party_Route_17_Biker_E_0
	db 25, KOFFING, WEEZING, KOFFING, KOFFING, WEEZING, 0
; Route 14
.Archipelago_Trainer_Party_Route_14_Biker_C_0
	db 26, KOFFING, KOFFING, GRIMER, KOFFING, 0
.Archipelago_Trainer_Party_Route_14_Biker_D_0
	db 28, GRIMER, GRIMER, KOFFING, 0
.Archipelago_Trainer_Party_Route_14_Biker_E_0
	db 29, KOFFING, MUK, 0

BurglarData:
; Unused
	db 29, GROWLITHE, VULPIX, 0
	db 33, GROWLITHE, 0
	db 28, VULPIX, CHARMANDER, PONYTA, 0
; Cinnabar Gym
.Archipelago_Trainer_Party_Cinnabar_Gym_Burglar_A_0
	db 36, GROWLITHE, VULPIX, NINETALES, 0
.Archipelago_Trainer_Party_Cinnabar_Gym_Burglar_B_0
	db 41, PONYTA, 0
.Archipelago_Trainer_Party_Cinnabar_Gym_Burglar_C_0
	db 37, VULPIX, GROWLITHE, 0
; Mansion 2F
.Archipelago_Trainer_Party_Mansion_2F_Burglar_A_0
	db 34, CHARMANDER, CHARMELEON, 0
; Mansion 3F
.Archipelago_Trainer_Party_Mansion_3F_Burglar_A_0
	db 38, NINETALES, 0
; Mansion B1F
.Archipelago_Trainer_Party_Mansion_B1F_Burglar_A_0
	db 34, GROWLITHE, PONYTA, 0

EngineerData:
; Unused
	db 21, VOLTORB, MAGNEMITE, 0
; Route 11
.Archipelago_Trainer_Party_Route_11_Engineer_A_0
	db 21, MAGNEMITE, 0
.Archipelago_Trainer_Party_Route_11_Engineer_B_0
	db 18, MAGNEMITE, MAGNEMITE, MAGNETON, 0

UnusedJugglerData:
; none

FisherData:
; SS Anne 2F Rooms
.Archipelago_Trainer_Party_SS_Anne_2F_Rooms_Fisher_A_0
	db 17, GOLDEEN, TENTACOOL, GOLDEEN, 0
; SS Anne B1F Rooms
.Archipelago_Trainer_Party_SS_Anne_B1F_Rooms_Fisher_A_0
	db 17, TENTACOOL, STARYU, SHELLDER, 0
; Route 12
.Archipelago_Trainer_Party_Route_12_Fisher_A_0
	db 22, GOLDEEN, POLIWAG, GOLDEEN, 0
.Archipelago_Trainer_Party_Route_12_Fisher_B_0
	db 24, TENTACOOL, GOLDEEN, 0
.Archipelago_Trainer_Party_Route_12_Fisher_C_0
	db 27, GOLDEEN, 0
.Archipelago_Trainer_Party_Route_12_Fisher_D_0
	db 21, POLIWAG, SHELLDER, GOLDEEN, HORSEA, 0
; Route 21
.Archipelago_Trainer_Party_Route_21_Fisher_A_0
	db 28, SEAKING, GOLDEEN, SEAKING, SEAKING, 0
.Archipelago_Trainer_Party_Route_21_Fisher_B_0
	db 31, SHELLDER, CLOYSTER, 0
.Archipelago_Trainer_Party_Route_21_Fisher_C_0
	db 27, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, MAGIKARP, 0
.Archipelago_Trainer_Party_Route_21_Fisher_D_0
	db 33, SEAKING, GOLDEEN, 0
; Route 12
.Archipelago_Trainer_Party_Route_12_Fisher_F_0
	db 24, MAGIKARP, MAGIKARP, 0

SwimmerData:
; Cerulean Gym
.Archipelago_Trainer_Party_Cerulean_Gym_Swimmer_A_0
	db 16, HORSEA, SHELLDER, 0
; Route 19
.Archipelago_Trainer_Party_Route_19_Swimmer_A_0
	db 30, TENTACOOL, SHELLDER, 0
.Archipelago_Trainer_Party_Route_19_Swimmer_B_0
	db 29, GOLDEEN, HORSEA, STARYU, 0
.Archipelago_Trainer_Party_Route_19_Swimmer_C_0
	db 30, POLIWAG, POLIWHIRL, 0
.Archipelago_Trainer_Party_Route_19_Swimmer_D_0
	db 27, HORSEA, TENTACOOL, TENTACOOL, GOLDEEN, 0
.Archipelago_Trainer_Party_Route_19_Swimmer_E_0
	db 29, GOLDEEN, SHELLDER, SEAKING, 0
.Archipelago_Trainer_Party_Route_19_Swimmer_F_0
	db 30, HORSEA, HORSEA, 0
.Archipelago_Trainer_Party_Route_19_Swimmer_G_0
	db 27, TENTACOOL, TENTACOOL, STARYU, HORSEA, TENTACRUEL, 0
; Route 20
.Archipelago_Trainer_Party_Route_20_Swimmer_A_0
	db 31, SHELLDER, CLOYSTER, 0
.Archipelago_Trainer_Party_Route_20_Swimmer_B_0
	db 35, STARYU, 0
.Archipelago_Trainer_Party_Route_20_Swimmer_C_0
	db 28, HORSEA, HORSEA, SEADRA, HORSEA, 0
; Route 21
.Archipelago_Trainer_Party_Route_21_Swimmer_A_0
	db 33, SEADRA, TENTACRUEL, 0
.Archipelago_Trainer_Party_Route_21_Swimmer_B_0
	db 37, STARMIE, 0
.Archipelago_Trainer_Party_Route_21_Swimmer_C_0
	db 33, STARYU, WARTORTLE, 0
.Archipelago_Trainer_Party_Route_21_Swimmer_D_0
	db 32, POLIWHIRL, TENTACOOL, SEADRA, 0

CueBallData:
; Route 16
.Archipelago_Trainer_Party_Route_16_CueBall_A_0
	db 28, MACHOP, MANKEY, MACHOP, 0
.Archipelago_Trainer_Party_Route_16_CueBall_B_0
	db 29, MANKEY, MACHOP, 0
.Archipelago_Trainer_Party_Route_16_CueBall_C_0
	db 33, MACHOP, 0
; Route 17
.Archipelago_Trainer_Party_Route_17_CueBall_A_0
	db 29, MANKEY, PRIMEAPE, 0
.Archipelago_Trainer_Party_Route_17_CueBall_B_0
	db 29, MACHOP, MACHOKE, 0
.Archipelago_Trainer_Party_Route_17_CueBall_C_0
	db 33, MACHOKE, 0
.Archipelago_Trainer_Party_Route_17_CueBall_D_0
	db 26, MANKEY, MANKEY, MACHOKE, MACHOP, 0
.Archipelago_Trainer_Party_Route_17_CueBall_E_0
	db 29, PRIMEAPE, MACHOKE, 0
; Route 21
.Archipelago_Trainer_Party_Route_21_CueBall_A_0
	db 31, TENTACOOL, TENTACOOL, TENTACRUEL, 0

GamblerData:
; Route 11
.Archipelago_Trainer_Party_Route_11_Gambler_A_0
	db 18, POLIWAG, HORSEA, 0
.Archipelago_Trainer_Party_Route_11_Gambler_B_0
	db 18, BELLSPROUT, ODDISH, 0
.Archipelago_Trainer_Party_Route_11_Gambler_C_0
	db 18, VOLTORB, MAGNEMITE, 0
.Archipelago_Trainer_Party_Route_11_Gambler_D_0
	db 18, GROWLITHE, VULPIX, 0
; Route 8
.Archipelago_Trainer_Party_Route_8_Gambler_A_0
	db 22, POLIWAG, POLIWAG, POLIWHIRL, 0
; Unused
	db 22, ONIX, GEODUDE, GRAVELER, 0
; Route 8
.Archipelago_Trainer_Party_Route_8_Gambler_C_0
	db 24, GROWLITHE, VULPIX, 0

BeautyData:
; Celadon Gym
.Archipelago_Trainer_Party_Celadon_Gym_Beauty_A_0
	db 21, ODDISH, BELLSPROUT, ODDISH, BELLSPROUT, 0
.Archipelago_Trainer_Party_Celadon_Gym_Beauty_B_0
	db 24, BELLSPROUT, BELLSPROUT, 0
.Archipelago_Trainer_Party_Celadon_Gym_Beauty_C_0
	db 26, EXEGGCUTE, 0
; Route 13
.Archipelago_Trainer_Party_Route_13_Beauty_A_0
	db 27, RATTATA, VULPIX, RATTATA, 0
.Archipelago_Trainer_Party_Route_13_Beauty_B_0
	db 29, CLEFAIRY, MEOWTH, 0
; Route 20
.Archipelago_Trainer_Party_Route_20_Beauty_A_0
	db 35, SEAKING, 0
.Archipelago_Trainer_Party_Route_20_Beauty_B_0
	db 30, SHELLDER, SHELLDER, CLOYSTER, 0
.Archipelago_Trainer_Party_Route_20_Beauty_C_0
	db 31, POLIWAG, SEAKING, 0
; Route 15
.Archipelago_Trainer_Party_Route_15_Beauty_A_0
	db 29, PIDGEOTTO, WIGGLYTUFF, 0
.Archipelago_Trainer_Party_Route_15_Beauty_B_0
	db 29, BULBASAUR, IVYSAUR, 0
; Unused
	db 33, WEEPINBELL, BELLSPROUT, WEEPINBELL, 0
; Route 19
.Archipelago_Trainer_Party_Route_19_Beauty_A_0
	db 27, POLIWAG, GOLDEEN, SEAKING, GOLDEEN, POLIWAG, 0
.Archipelago_Trainer_Party_Route_19_Beauty_B_0
	db 30, GOLDEEN, SEAKING, 0
.Archipelago_Trainer_Party_Route_19_Beauty_C_0
	db 29, STARYU, STARYU, STARYU, 0
; Route 20
.Archipelago_Trainer_Party_Route_20_Beauty_E_0
	db 30, SEADRA, HORSEA, SEADRA, 0

PsychicData:
; Saffron Gym
.Archipelago_Trainer_Party_Saffron_Gym_Psychic_A_0
	db 31, KADABRA, SLOWPOKE, MR_MIME, KADABRA, 0
.Archipelago_Trainer_Party_Saffron_Gym_Psychic_B_0
	db 34, MR_MIME, KADABRA, 0
.Archipelago_Trainer_Party_Saffron_Gym_Psychic_C_0
	db 33, SLOWPOKE, SLOWPOKE, SLOWBRO, 0
.Archipelago_Trainer_Party_Saffron_Gym_Psychic_D_0
	db 38, SLOWBRO, 0

RockerData:
; Vermilion Gym
.Archipelago_Trainer_Party_Vermilion_Gym_Rocker_A_0
	db 20, VOLTORB, VOLTORB, VOLTORB, 0
; Route 12
.Archipelago_Trainer_Party_Route_12_Rocker_A_0
	db 29, VOLTORB, ELECTRODE, 0

JugglerData:
; Silph Co. 5F
.Archipelago_Trainer_Party_Silph_Co_5F_Juggler_A_0
	db 29, KADABRA, MR_MIME, 0
; Victory Road 2F
.Archipelago_Trainer_Party_Victory_Road_2F_Juggler_A_0
	db 41, DROWZEE, HYPNO, KADABRA, KADABRA, 0
; Fuchsia Gym
.Archipelago_Trainer_Party_Fuchsia_Gym_Juggler_A_0
	db 31, DROWZEE, DROWZEE, KADABRA, DROWZEE, 0
.Archipelago_Trainer_Party_Fuchsia_Gym_Juggler_B_0
	db 34, DROWZEE, HYPNO, 0
; Victory Road 2F
.Archipelago_Trainer_Party_Victory_Road_2F_Juggler_C_0
	db 48, MR_MIME, 0
; Unused
	db 33, HYPNO, 0
; Fuchsia Gym
.Archipelago_Trainer_Party_Fuchsia_Gym_Juggler_D_0
	db 38, HYPNO, 0
.Archipelago_Trainer_Party_Fuchsia_Gym_Juggler_E_0
	db 34, DROWZEE, KADABRA, 0

TamerData:
; Fuchsia Gym
.Archipelago_Trainer_Party_Fuchsia_Gym_Tamer_A_0
	db 34, SANDSLASH, ARBOK, 0
.Archipelago_Trainer_Party_Fuchsia_Gym_Tamer_B_0
	db 33, ARBOK, SANDSLASH, ARBOK, 0
; Viridian Gym
.Archipelago_Trainer_Party_Viridian_Gym_Tamer_A_0
	db 43, RHYHORN, 0
.Archipelago_Trainer_Party_Viridian_Gym_Tamer_B_0
	db 39, ARBOK, TAUROS, 0
; Victory Road 2F
.Archipelago_Trainer_Party_Victory_Road_2F_Tamer_A_0
	db 44, PERSIAN, GOLDUCK, 0
; Unused
	db 42, RHYHORN, PRIMEAPE, ARBOK, TAUROS, 0

BirdKeeperData:
; Route 13
.Archipelago_Trainer_Party_Route_13_BirdKeeper_A_0
	db 29, PIDGEY, PIDGEOTTO, 0
.Archipelago_Trainer_Party_Route_13_BirdKeeper_B_0
	db 25, SPEAROW, PIDGEY, PIDGEY, SPEAROW, SPEAROW, 0
.Archipelago_Trainer_Party_Route_13_BirdKeeper_C_0
	db 26, PIDGEY, PIDGEOTTO, SPEAROW, FEAROW, 0
; Route 14
.Archipelago_Trainer_Party_Route_14_BirdKeeper_A_0
	db 33, FARFETCHD, 0
.Archipelago_Trainer_Party_Route_14_BirdKeeper_B_0
	db 29, SPEAROW, FEAROW, 0
; Route 15
.Archipelago_Trainer_Party_Route_15_BirdKeeper_A_0
	db 26, PIDGEOTTO, FARFETCHD, DODUO, PIDGEY, 0
.Archipelago_Trainer_Party_Route_15_BirdKeeper_B_0
	db 28, DODRIO, DODUO, DODUO, 0
; Route 18
.Archipelago_Trainer_Party_Route_18_BirdKeeper_A_0
	db 29, SPEAROW, FEAROW, 0
.Archipelago_Trainer_Party_Route_18_BirdKeeper_B_0
	db 34, DODRIO, 0
.Archipelago_Trainer_Party_Route_18_BirdKeeper_C_0
	db 26, SPEAROW, SPEAROW, FEAROW, SPEAROW, 0
; Route 20
.Archipelago_Trainer_Party_Route_20_BirdKeeper_A_0
	db 30, FEAROW, FEAROW, PIDGEOTTO, 0
; Unused
	db 39, PIDGEOTTO, PIDGEOTTO, PIDGEY, PIDGEOTTO, 0
	db 42, FARFETCHD, FEAROW, 0
; Route 14
.Archipelago_Trainer_Party_Route_14_BirdKeeper_D_0
	db 28, PIDGEY, DODUO, PIDGEOTTO, 0
.Archipelago_Trainer_Party_Route_14_BirdKeeper_E_0
	db 26, PIDGEY, SPEAROW, PIDGEY, FEAROW, 0
.Archipelago_Trainer_Party_Route_14_BirdKeeper_F_0
	db 29, PIDGEOTTO, FEAROW, 0
.Archipelago_Trainer_Party_Route_14_BirdKeeper_G_0
	db 28, SPEAROW, DODUO, FEAROW, 0

BlackbeltData:
; Fighting Dojo
.Archipelago_Trainer_Party_Fighting_Dojo_Blackbelt_A_0
	db 37, HITMONLEE, HITMONCHAN, 0
.Archipelago_Trainer_Party_Fighting_Dojo_Blackbelt_B_0
	db 31, MANKEY, MANKEY, PRIMEAPE, 0
.Archipelago_Trainer_Party_Fighting_Dojo_Blackbelt_C_0
	db 32, MACHOP, MACHOKE, 0
.Archipelago_Trainer_Party_Fighting_Dojo_Blackbelt_D_0
	db 36, PRIMEAPE, 0
.Archipelago_Trainer_Party_Fighting_Dojo_Blackbelt_E_0
	db 31, MACHOP, MANKEY, PRIMEAPE, 0
; Viridian Gym
.Archipelago_Trainer_Party_Viridian_Gym_Blackbelt_A_0
	db 40, MACHOP, MACHOKE, 0
.Archipelago_Trainer_Party_Viridian_Gym_Blackbelt_B_0
	db 43, MACHOKE, 0
.Archipelago_Trainer_Party_Viridian_Gym_Blackbelt_C_0
	db 38, MACHOKE, MACHOP, MACHOKE, 0
; Victory Road 2F
.Archipelago_Trainer_Party_Victory_Road_2F_Blackbelt_A_0
	db 43, MACHOKE, MACHOP, MACHOKE, 0

Rival1Data:
.Archipelago_Rival_Eevee_A_1
.Archipelago_Trainer_Party_Oaks_Lab_Rival1_A_0
	db 5, EEVEE, 0
; Route 22
.Archipelago_Rival_Eevee_B_4
.Archipelago_Trainer_Party_Route_22_Rival1_A_0
	db $FF, 9, SPEAROW, 8, EEVEE, 0
; Cerulean City
.Archipelago_Rival_Eevee_C_8
.Archipelago_Trainer_Party_Cerulean_City_Rival1_A_0
	db $FF, 18, SPEAROW, 15, SANDSHREW, 15, RATTATA, 17, EEVEE, 0

ProfOakData:
; Unused
	db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, BLASTOISE, 70, GYARADOS, 0
	db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, VENUSAUR, 70, GYARADOS, 0
	db $FF, 66, TAUROS, 67, EXEGGUTOR, 68, ARCANINE, 69, CHARIZARD, 70, GYARADOS, 0

ChiefData:
; none

ScientistData:
; Mansion 1F
.Archipelago_Trainer_Party_Mansion_1F_Scientist_A_0
	db 29, ELECTRODE, WEEZING, 0
; Silph Co. 2F
.Archipelago_Trainer_Party_Silph_Co_2F_Scientist_A_0
	db 26, GRIMER, WEEZING, KOFFING, WEEZING, 0
.Archipelago_Trainer_Party_Silph_Co_2F_Scientist_B_0
	db 28, MAGNEMITE, VOLTORB, MAGNETON, 0
; Silph Co. 3F
.Archipelago_Trainer_Party_Silph_Co_3F_Scientist_A_0
	db 29, ELECTRODE, WEEZING, 0
; Silph Co. 4F
.Archipelago_Trainer_Party_Silph_Co_4F_Scientist_A_0
	db 33, ELECTRODE, 0
; Silph Co. 5F
.Archipelago_Trainer_Party_Silph_Co_5F_Scientist_A_0
	db 26, MAGNETON, KOFFING, WEEZING, MAGNEMITE, 0
; Silph Co. 6F
.Archipelago_Trainer_Party_Silph_Co_6F_Scientist_A_0
	db 25, VOLTORB, KOFFING, MAGNETON, MAGNEMITE, KOFFING, 0
; Silph Co. 7F
.Archipelago_Trainer_Party_Silph_Co_7F_Scientist_A_0
	db 29, ELECTRODE, MUK, 0
; Silph Co. 8F
.Archipelago_Trainer_Party_Silph_Co_8F_Scientist_A_0
	db 29, GRIMER, ELECTRODE, 0
; Silph Co. 9F
.Archipelago_Trainer_Party_Silph_Co_9F_Scientist_A_0
	db 28, VOLTORB, KOFFING, MAGNETON, 0
; Silph Co. 10F
.Archipelago_Trainer_Party_Silph_Co_10F_Scientist_A_0
	db 29, MAGNEMITE, KOFFING, 0
; Mansion 3F
.Archipelago_Trainer_Party_Mansion_3F_Scientist_A_0
	db 33, MAGNEMITE, MAGNETON, VOLTORB, 0
; Mansion B1F
.Archipelago_Trainer_Party_Mansion_B1F_Scientist_A_0
	db 34, MAGNEMITE, ELECTRODE, 0

GiovanniData:
; Rocket Hideout B4F
.Archipelago_Trainer_Party_Rocket_Hideout_B4F_Giovanni_A_0
	db $FF, 25, ONIX, 24, RHYHORN, 29, PERSIAN, 0
; Silph Co. 11F
.Archipelago_Trainer_Party_Silph_Co_11F_Giovanni_A_0
	db $FF, 37, NIDORINO, 35, PERSIAN, 37, RHYHORN, 41, NIDOQUEEN, 0
; Viridian Gym
.Archipelago_Trainer_Party_Viridian_Gym_Giovanni_A_0
	db $FF, 50, DUGTRIO, 53, PERSIAN, 53, NIDOQUEEN, 55, NIDOKING, 55, RHYDON, 0

RocketData:
; Mt. Moon B2F
.Archipelago_Trainer_Party_Mt_Moon_B2F_Rocket_A_0
	db 13, RATTATA, ZUBAT, 0
.Archipelago_Trainer_Party_Mt_Moon_B2F_Rocket_B_0
	db 11, SANDSHREW, RATTATA, ZUBAT, 0
.Archipelago_Trainer_Party_Mt_Moon_B2F_Rocket_C_0
	db 12, ZUBAT, EKANS, 0
.Archipelago_Trainer_Party_Mt_Moon_B2F_Rocket_D_0
	db 16, RATICATE, 0
; Cerulean City
.Archipelago_Trainer_Party_Cerulean_City_Rocket_A_0
	db 17, MACHOP, DROWZEE, 0
; Route 24
.Archipelago_Trainer_Party_Route_24_Rocket_A_0
	db 15, EKANS, ZUBAT, 0
; Game Corner
.Archipelago_Trainer_Party_Game_Corner_Rocket_A_0
	db 20, RATICATE, ZUBAT, 0
; Rocket Hideout B1F
.Archipelago_Trainer_Party_Rocket_Hideout_B1F_Rocket_A_0
	db 21, DROWZEE, MACHOP, 0
.Archipelago_Trainer_Party_Rocket_Hideout_B1F_Rocket_B_0
	db 21, RATICATE, RATICATE, 0
.Archipelago_Trainer_Party_Rocket_Hideout_B1F_Rocket_C_0
	db 20, GRIMER, KOFFING, KOFFING, 0
.Archipelago_Trainer_Party_Rocket_Hideout_B1F_Rocket_D_0
	db 19, RATTATA, RATICATE, RATICATE, RATTATA, 0
.Archipelago_Trainer_Party_Rocket_Hideout_B1F_Rocket_E_0
	db 22, GRIMER, KOFFING, 0
; Rocket Hideout B2F
.Archipelago_Trainer_Party_Rocket_Hideout_B2F_Rocket_A_0
	db 17, ZUBAT, KOFFING, GRIMER, ZUBAT, RATICATE, 0
; Rocket Hideout B3F
.Archipelago_Trainer_Party_Rocket_Hideout_B3F_Rocket_A_0
	db 20, RATTATA, RATICATE, DROWZEE, 0
.Archipelago_Trainer_Party_Rocket_Hideout_B3F_Rocket_B_0
	db 21, MACHOP, MACHOP, 0
; Rocket Hideout B4F
.Archipelago_Trainer_Party_Rocket_Hideout_B4F_Rocket_A_0
	db 23, SANDSHREW, EKANS, SANDSLASH, 0
.Archipelago_Trainer_Party_Rocket_Hideout_B4F_Rocket_B_0
	db 23, EKANS, SANDSHREW, ARBOK, 0
.Archipelago_Trainer_Party_Rocket_Hideout_B4F_Rocket_C_0
	db 21, KOFFING, ZUBAT, 0
; Pokémon Tower 7F
.Archipelago_Trainer_Party_Pokemon_Tower_7F_Rocket_A_0
	db 25, ZUBAT, ZUBAT, GOLBAT, 0
.Archipelago_Trainer_Party_Pokemon_Tower_7F_Rocket_B_0
	db 26, KOFFING, DROWZEE, 0
.Archipelago_Trainer_Party_Pokemon_Tower_7F_Rocket_C_0
	db 23, ZUBAT, RATTATA, RATICATE, ZUBAT, 0
; Unused
	db 26, DROWZEE, KOFFING, 0
; Silph Co. 2F
.Archipelago_Trainer_Party_Silph_Co_2F_Rocket_A_0
	db 29, CUBONE, ZUBAT, 0
.Archipelago_Trainer_Party_Silph_Co_2F_Rocket_B_0
	db 25, GOLBAT, ZUBAT, ZUBAT, RATICATE, ZUBAT, 0
; Silph Co. 3F
.Archipelago_Trainer_Party_Silph_Co_3F_Rocket_A_0
	db 28, RATICATE, HYPNO, RATICATE, 0
; Silph Co. 4F
.Archipelago_Trainer_Party_Silph_Co_4F_Rocket_A_0
	db 29, MACHOP, DROWZEE, 0
.Archipelago_Trainer_Party_Silph_Co_4F_Rocket_B_0
	db 28, EKANS, ZUBAT, CUBONE, 0
; Silph Co. 5F
.Archipelago_Trainer_Party_Silph_Co_5F_Rocket_A_0
	db 33, ARBOK, 0
.Archipelago_Trainer_Party_Silph_Co_5F_Rocket_B_0
	db 33, HYPNO, 0
; Silph Co. 6F
.Archipelago_Trainer_Party_Silph_Co_6F_Rocket_A_0
	db 29, MACHOP, MACHOKE, 0
.Archipelago_Trainer_Party_Silph_Co_6F_Rocket_B_0
	db 28, ZUBAT, ZUBAT, GOLBAT, 0
; Silph Co. 7F
.Archipelago_Trainer_Party_Silph_Co_7F_Rocket_A_0
	db 26, RATICATE, ARBOK, KOFFING, GOLBAT, 0
.Archipelago_Trainer_Party_Silph_Co_7F_Rocket_B_0
	db 29, CUBONE, CUBONE, 0
.Archipelago_Trainer_Party_Silph_Co_7F_Rocket_C_0
	db 29, SANDSHREW, SANDSLASH, 0
; Silph Co. 8F
.Archipelago_Trainer_Party_Silph_Co_8F_Rocket_A_0
	db 26, RATICATE, ZUBAT, GOLBAT, RATTATA, 0
.Archipelago_Trainer_Party_Silph_Co_8F_Rocket_B_0
	db 28, WEEZING, GOLBAT, KOFFING, 0
; Silph Co. 9F
.Archipelago_Trainer_Party_Silph_Co_9F_Rocket_A_0
	db 28, DROWZEE, GRIMER, MACHOP, 0
.Archipelago_Trainer_Party_Silph_Co_9F_Rocket_B_0
	db 28, GOLBAT, DROWZEE, HYPNO, 0
; Silph Co. 10F
.Archipelago_Trainer_Party_Silph_Co_10F_Rocket_A_0
	db 33, MACHOKE, 0
; Silph Co. 11F
.Archipelago_Trainer_Party_Silph_Co_11F_Rocket_A_0
	db 25, RATTATA, RATTATA, ZUBAT, RATTATA, EKANS, 0
.Archipelago_Trainer_Party_Silph_Co_11F_Rocket_B_0
	db 32, CUBONE, DROWZEE, MAROWAK, 0
; Jessie & James
.Archipelago_Trainer_Party_Mt_Moon_B2F_Rocket_Jessie_James_A_0
	db 14, EKANS, MEOWTH, KOFFING, 0
.Archipelago_Trainer_Party_Pokemon_Tower_7F_Rocket_Jessie_James_A_0
	db 25, KOFFING, MEOWTH, EKANS, 0
.Archipelago_Trainer_Party_Rocket_Hideout_B4F_Rocket_Jessie_James_A_0
	db 27, MEOWTH, ARBOK, WEEZING, 0
.Archipelago_Trainer_Party_Silph_Co_11F_Rocket_Jessie_James_A_0
	db 31, WEEZING, ARBOK, MEOWTH, 0
; Unused
	db 16, KOFFING, 0
	db 27, KOFFING, 0
	db 29, WEEZING, 0
	db 33, WEEZING, 0

CooltrainerMData:
; Viridian Gym
.Archipelago_Trainer_Party_Viridian_Gym_CooltrainerM_A_0
	db 39, NIDORINO, NIDOKING, 0
; Victory Road 3F
.Archipelago_Trainer_Party_Victory_Road_3F_CooltrainerM_A_0
	db 43, EXEGGUTOR, CLOYSTER, ARCANINE, 0
.Archipelago_Trainer_Party_Victory_Road_3F_CooltrainerM_B_0
	db 43, KINGLER, TENTACRUEL, BLASTOISE, 0
; Unused
	db 45, KINGLER, STARMIE, 0
; Victory Road 1F
.Archipelago_Trainer_Party_Victory_Road_1F_CooltrainerM_A_0
	db 42, IVYSAUR, WARTORTLE, CHARMELEON, CHARIZARD, 0
; Unused
	db 44, IVYSAUR, WARTORTLE, CHARMELEON, 0
	db 49, NIDOKING, 0
	db 44, KINGLER, CLOYSTER, 0
; Viridian Gym
.Archipelago_Trainer_Party_Viridian_Gym_CooltrainerM_C_0
	db 39, SANDSLASH, DUGTRIO, 0
.Archipelago_Trainer_Party_Viridian_Gym_CooltrainerM_D_0
	db 43, RHYHORN, 0

CooltrainerFData:
; Celadon Gym
.Archipelago_Trainer_Party_Celadon_Gym_CooltrainerF_A_0
	db 24, WEEPINBELL, GLOOM, IVYSAUR, 0
; Victory Road 3F
.Archipelago_Trainer_Party_Victory_Road_3F_CooltrainerF_A_0
	db 43, BELLSPROUT, WEEPINBELL, VICTREEBEL, 0
.Archipelago_Trainer_Party_Victory_Road_3F_CooltrainerF_B_0
	db 43, PARASECT, DEWGONG, CHANSEY, 0
; Unused
	db 46, VILEPLUME, BUTTERFREE, 0
; Victory Road 1F
.Archipelago_Trainer_Party_Victory_Road_1F_CooltrainerF_A_0
	db 44, PERSIAN, NINETALES, 0
; Unused
	db 45, IVYSAUR, VENUSAUR, 0
	db 45, NIDORINA, NIDOQUEEN, 0
	db 43, PERSIAN, NINETALES, RAICHU, 0

BrunoData:
.Archipelago_Trainer_Party_Bruno_A_0
	db $FF, 53, ONIX, 55, HITMONCHAN, 55, HITMONLEE, 56, ONIX, 58, MACHAMP, 0

BrockData:
.Archipelago_Trainer_Party_Brock_A_0
	db $FF, 10, GEODUDE, 12, ONIX, 0

MistyData:
.Archipelago_Trainer_Party_Misty_A_0
	db $FF, 18, STARYU, 21, STARMIE, 0

LtSurgeData:
.Archipelago_Trainer_Party_LtSurge_A_0
	db $FF, 28, RAICHU, 0

ErikaData:
.Archipelago_Trainer_Party_Erika_A_0
	db $FF, 30, TANGELA, 32, WEEPINBELL, 32, GLOOM, 0

KogaData:
.Archipelago_Trainer_Party_Koga_A_0
	db $FF, 44, VENONAT, 46, VENONAT, 48, VENONAT, 50, VENOMOTH, 0

BlaineData:
.Archipelago_Trainer_Party_Blaine_A_0
	db $FF, 48, NINETALES, 50, RAPIDASH, 54, ARCANINE, 0

SabrinaData:
.Archipelago_Trainer_Party_Sabrina_A_0
	db $FF, 50, ABRA, 50, KADABRA, 50, ALAKAZAM, 0

GentlemanData:
; SS Anne 1F Rooms
.Archipelago_Trainer_Party_SS_Anne_1F_Rooms_Gentleman_A_0
	db 18, GROWLITHE, GROWLITHE, 0
.Archipelago_Trainer_Party_SS_Anne_1F_Rooms_Gentleman_B_0
	db 19, NIDORAN_M, NIDORAN_F, 0
; SS Anne 2F Rooms
.Archipelago_Trainer_Party_SS_Anne_2F_Rooms_Gentleman_A_0
	db 22, VOLTORB, MAGNEMITE, 0
; Vermilion Gym
.Archipelago_Trainer_Party_Vermilion_Gym_Gentleman_A_0
	db 22, VOLTORB, MAGNEMITE, 0
; SS Anne 2F Rooms
.Archipelago_Trainer_Party_SS_Anne_2F_Rooms_Gentleman_C_0
	db 17, GROWLITHE, PONYTA, 0

Rival2Data:
; SS Anne 2F
.Archipelago_Rival_Eevee_D_8
.Archipelago_Trainer_Party_SS_Anne_2F_Rival2_A_0
	db $FF, 19, SPEAROW, 16, RATTATA, 18, SANDSHREW, 20, EEVEE, 0
; Pokémon Tower 2F
.Archipelago_Rival_Eevee_Jolteon_E_10
.Archipelago_Trainer_Party_Pokemon_Tower_2F_Rival2_Jolteon_A_0
	db $FF, 25, FEAROW, 23, SHELLDER, 22, VULPIX, 20, SANDSHREW, 25, EEVEE, 0
.Archipelago_Rival_Eevee_Flareon_E_10
.Archipelago_Trainer_Party_Pokemon_Tower_2F_Rival2_Flareon_A_0
	db $FF, 25, FEAROW, 23, MAGNEMITE, 22, SHELLDER, 20, SANDSHREW, 25, EEVEE, 0
.Archipelago_Rival_Eevee_Vaporeon_E_10
.Archipelago_Trainer_Party_Pokemon_Tower_2F_Rival2_Vaporeon_A_0
	db $FF, 25, FEAROW, 23, VULPIX, 22, MAGNEMITE, 20, SANDSHREW, 25, EEVEE, 0
; Silph Co. 7F
.Archipelago_Rival_Eeveelution_Jolteon_F_10
.Archipelago_Trainer_Party_Silph_Co_7F_Rival2_Jolteon_A_0
	db $FF, 38, SANDSLASH, 35, NINETALES, 37, CLOYSTER, 35, KADABRA, 40, JOLTEON, 0
.Archipelago_Rival_Eeveelution_Flareon_F_10
.Archipelago_Trainer_Party_Silph_Co_7F_Rival2_Flareon_A_0
	db $FF, 38, SANDSLASH, 35, CLOYSTER, 37, MAGNETON, 35, KADABRA, 40, FLAREON, 0
.Archipelago_Rival_Eeveelution_Vaporeon_F_10
.Archipelago_Trainer_Party_Silph_Co_7F_Rival2_Vaporeon_A_0
	db $FF, 38, SANDSLASH, 35, MAGNETON, 37, NINETALES, 35, KADABRA, 40, VAPOREON, 0
; Route 22
.Archipelago_Rival_Eeveelution_Jolteon_G_12
.Archipelago_Trainer_Party_Route_22_Rival2_Jolteon_A_0
	db $FF, 47, SANDSLASH, 45, EXEGGCUTE, 45, NINETALES, 47, CLOYSTER, 50, KADABRA, 53, JOLTEON, 0
.Archipelago_Rival_Eeveelution_Flareon_G_12
.Archipelago_Trainer_Party_Route_22_Rival2_Flareon_A_0
	db $FF, 47, SANDSLASH, 45, EXEGGCUTE, 45, CLOYSTER, 47, MAGNETON, 50, KADABRA, 53, FLAREON, 0
.Archipelago_Rival_Eeveelution_Vaporeon_G_12
.Archipelago_Trainer_Party_Route_22_Rival2_Vaporeon_A_0
	db $FF, 47, SANDSLASH, 45, EXEGGCUTE, 45, MAGNETON, 47, NINETALES, 50, KADABRA, 53, VAPOREON, 0

Rival3Data:
.Archipelago_Rival_Eeveelution_Jolteon_H_12
.Archipelago_Trainer_Party_Indigo_Plateau_Rival3_Jolteon_A_0
	db $FF, 61, SANDSLASH, 59, ALAKAZAM, 61, EXEGGUTOR, 61, CLOYSTER, 63, NINETALES, 65, JOLTEON, 0
.Archipelago_Rival_Eeveelution_Flareon_H_12
.Archipelago_Trainer_Party_Indigo_Plateau_Rival3_Flareon_A_0
	db $FF, 61, SANDSLASH, 59, ALAKAZAM, 61, EXEGGUTOR, 61, MAGNETON, 63, CLOYSTER, 65, FLAREON, 0
.Archipelago_Rival_Eeveelution_Vaporeon_H_12
.Archipelago_Trainer_Party_Indigo_Plateau_Rival3_Vaporeon_A_0
	db $FF, 61, SANDSLASH, 59, ALAKAZAM, 61, EXEGGUTOR, 61, NINETALES, 63, MAGNETON, 65, VAPOREON, 0

LoreleiData:
.Archipelago_Trainer_Party_Lorelei_A_0
	db $FF, 54, DEWGONG, 53, CLOYSTER, 54, SLOWBRO, 56, JYNX, 56, LAPRAS, 0

ChannelerData:
; Unused
	db 22, GASTLY, 0
	db 24, GASTLY, 0
	db 23, GASTLY, GASTLY, 0
	db 24, GASTLY, 0
; Pokémon Tower 3F
.Archipelago_Trainer_Party_Pokemon_Tower_3F_Channeler_A_0
	db 23, GASTLY, 0
.Archipelago_Trainer_Party_Pokemon_Tower_3F_Channeler_B_0
	db 24, GASTLY, 0
; Unused
	db 24, HAUNTER, 0
; Pokémon Tower 3F
.Archipelago_Trainer_Party_Pokemon_Tower_3F_Channeler_D_0
	db 22, GASTLY, 0
; Pokémon Tower 4F
.Archipelago_Trainer_Party_Pokemon_Tower_4F_Channeler_A_0
	db 24, GASTLY, 0
.Archipelago_Trainer_Party_Pokemon_Tower_4F_Channeler_B_0
	db 23, GASTLY, GASTLY, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 4F
.Archipelago_Trainer_Party_Pokemon_Tower_4F_Channeler_D_0
	db 22, GASTLY, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 5F
.Archipelago_Trainer_Party_Pokemon_Tower_5F_Channeler_A_0
	db 23, HAUNTER, 0
; Unused
	db 24, GASTLY, 0
; Pokémon Tower 5F
.Archipelago_Trainer_Party_Pokemon_Tower_5F_Channeler_C_0
	db 22, GASTLY, 0
.Archipelago_Trainer_Party_Pokemon_Tower_5F_Channeler_D_0
	db 24, GASTLY, 0
.Archipelago_Trainer_Party_Pokemon_Tower_5F_Channeler_E_0
	db 22, HAUNTER, 0
; Pokémon Tower 6F
.Archipelago_Trainer_Party_Pokemon_Tower_6F_Channeler_A_0
	db 22, GASTLY, GASTLY, GASTLY, 0
.Archipelago_Trainer_Party_Pokemon_Tower_6F_Channeler_B_0
	db 24, GASTLY, 0
.Archipelago_Trainer_Party_Pokemon_Tower_6F_Channeler_C_0
	db 24, GASTLY, 0
; Saffron Gym
.Archipelago_Trainer_Party_Saffron_Gym_Channeler_A_0
	db 34, GASTLY, HAUNTER, 0
.Archipelago_Trainer_Party_Saffron_Gym_Channeler_B_0
	db 38, HAUNTER, 0
.Archipelago_Trainer_Party_Saffron_Gym_Channeler_C_0
	db 33, GASTLY, GASTLY, HAUNTER, 0

AgathaData:
.Archipelago_Trainer_Party_Agatha_A_0
	db $FF, 56, GENGAR, 56, GOLBAT, 55, HAUNTER, 58, ARBOK, 60, GENGAR, 0

LanceData:
.Archipelago_Trainer_Party_Lance_A_0
	db $FF, 58, GYARADOS, 56, DRAGONAIR, 56, DRAGONAIR, 60, AERODACTYL, 62, DRAGONITE, 0
