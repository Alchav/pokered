SafariZoneEast_Object:
	db $0 ; border block

	def_warp_events
	warp_event  0,  4, SAFARI_ZONE_NORTH, 7
	warp_event  0,  5, SAFARI_ZONE_NORTH, 8
	warp_event  0, 22, SAFARI_ZONE_CENTER, 7
	warp_event  0, 23, SAFARI_ZONE_CENTER, 7
	warp_event 25,  9, SAFARI_ZONE_EAST_REST_HOUSE, 1

	def_bg_events
	bg_event 26, 10, 5 ; SafariZoneEastText5
	bg_event  6,  4, 6 ; SafariZoneEastText6
	bg_event  5, 23, 7 ; SafariZoneEastText7

	def_object_events
.Archipelago_Missable_Safari_Zone_East_Item_1
	object_event 21, 10, SPRITE_POKE_BALL, STAY, NONE, 1, FULL_RESTORE
.Archipelago_Missable_Safari_Zone_East_Item_2
	object_event  3,  7, SPRITE_POKE_BALL, STAY, NONE, 2, MAX_POTION
.Archipelago_Missable_Safari_Zone_East_Item_3
	object_event 20, 13, SPRITE_POKE_BALL, STAY, NONE, 3, CARBOS
.Archipelago_Missable_Safari_Zone_East_Item_4
	object_event 15, 12, SPRITE_POKE_BALL, STAY, NONE, 4, TM_EGG_BOMB

	def_warps_to SAFARI_ZONE_EAST
