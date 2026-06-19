InitPlayerData:
InitPlayerData2:

	call Random
	ldh a, [hRandomSub]
	ld [wPlayerID], a

	call Random
	ldh a, [hRandomAdd]
	ld [wPlayerID + 1], a

	ld a, $ff
	ld [wUnusedD71B], a

	ld a, 90 ; initialize happiness to 90
	ld [wPikachuHappiness], a
	ld a, $80
	ld [wPikachuMood], a ; initialize mood

	ld hl, wPartyCount
	call InitializeEmptyList
	ld hl, wBoxCount
	call InitializeEmptyList
	ld hl, wNumBagItems
	call InitializeEmptyList
	ld hl, wNumBoxItems
	call InitializeEmptyList

	ld hl, wPlayerMoney
.Archipelago_Starting_Money_High_1
	ld a, 0
	ld [hli], a
.Archipelago_Starting_Money_Middle_1
	ld a, 0
	ld [hli], a
.Archipelago_Starting_Money_Low_1
	ld a, 0
	ld [hl], a

	xor a
	ld [wMonDataLocation], a

	ld hl, wObtainedBadges
	ld [hli], a

	ld [hl], a

	ld hl, wPlayerCoins
	ld [hli], a
	ld [hl], a

	ld hl, wGameProgressFlags
	ld bc, wGameProgressFlagsEnd - wGameProgressFlags
	call FillMemory ; clear all game progress flags

.Archipelago_Option_Pokedex_Seen_1
	ld a, 0
	and a
	jr z, .continue
	ld a, $ff
	ld hl, wPokedexSeen
	ld bc, wPokedexSeenEnd - wPokedexSeen - 1
	call FillMemory
	ld a, $7f
	ld [hl], a

.continue
	jp InitializeMissableObjectsFlags

InitializeEmptyList:
	xor a ; count
	ld [hli], a
	dec a ; terminator
	ld [hl], a
	ret
