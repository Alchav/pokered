Route18Gate1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  0,  4, ROUTE_18, 1
	warp_event  0,  5, ROUTE_18, 2
	warp_event  7,  4, ROUTE_18, 3
	warp_event  7,  5, ROUTE_18, 4
	warp_event  6,  8, ROUTE_18_GATE_2F, 1

	def_bg_events

	def_object_events
	object_event  4,  1, SPRITE_GUARD, STAY, DOWN, 1 ; person

	def_warps_to ROUTE_18_GATE_1F
