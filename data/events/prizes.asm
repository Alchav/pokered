PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

PrizeMenuMon1Entries:
.Archipelago_Prize_Mon_A2
	db ABRA
.Archipelago_Prize_Mon_B2
	db VULPIX
.Archipelago_Prize_Mon_C2
	db WIGGLYTUFF
	db "@"

PrizeMenuMon1Cost:
	bcd2 230
	bcd2 1000
	bcd2 2680
	db "@"

PrizeMenuMon2Entries:
.Archipelago_Prize_Mon_D2
	db SCYTHER
.Archipelago_Prize_Mon_E2
	db PINSIR
.Archipelago_Prize_Mon_F2
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
	bcd2 6500
	bcd2 6500
	bcd2 9999
	db "@"

PrizeMenuTMsEntries:
.Archipelago_Prize_Item_A_0
	db TM_DRAGON_RAGE
.Archipelago_Prize_Item_B_0
	db TM_HYPER_BEAM
.Archipelago_Prize_Item_C_0
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	bcd2 3300
	bcd2 5500
	bcd2 7700
	db "@"
