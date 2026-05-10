CeruleanCaveB1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  3,  6, CERULEAN_CAVE_1F, 9

	def_bg_events

	def_object_events
.Archipelago_Static_Encounter_Mewtwo_6
	object_event 27, 13, SPRITE_MONSTER, STAY, DOWN, 1, MEWTWO, 70
.Archipelago_Missable_Cerulean_Cave_B1F_Item_1
	object_event 26,  1, SPRITE_POKE_BALL, STAY, NONE, 2, ULTRA_BALL
.Archipelago_Missable_Cerulean_Cave_B1F_Item_2
	object_event  2, 13, SPRITE_POKE_BALL, STAY, NONE, 3, ULTRA_BALL
.Archipelago_Missable_Cerulean_Cave_B1F_Item_3
	object_event  3, 13, SPRITE_POKE_BALL, STAY, NONE, 4, MAX_REVIVE
.Archipelago_Missable_Cerulean_Cave_B1F_Item_4
	object_event 15,  3, SPRITE_POKE_BALL, STAY, NONE, 5, MAX_ELIXER

	def_warps_to CERULEAN_CAVE_B1F
