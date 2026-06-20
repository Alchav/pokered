IndigoPlateauLobby_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	ld hl, wBeatLorelei
	bit 1, [hl]
	res 1, [hl]
	ret z
	; Elite 4 events
	ResetEventRange ELITE4_EVENTS_START, EVENT_LANCES_ROOM_LOCK_DOOR
	ret

IndigoPlateauLobby_TextPointers:
	dw IndigoHealNurseText
	dw IndigoPlateauLobbyText2
	dw IndigoPlateauLobbyText3
	dw IndigoCashierText
	dw IndigoTradeNurseText
	dw IndigoPlateauLobbyText6
	dw IndigoGuardText

IndigoHealNurseText:
	script_pokecenter_nurse

IndigoPlateauLobbyText2:
	text_far _IndigoPlateauLobbyText2
	text_end

IndigoPlateauLobbyText3:
	text_far _IndigoPlateauLobbyText3
	text_end

IndigoTradeNurseText:
	script_cable_club_receptionist

IndigoPlateauLobbyText6:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd

IndigoGuardText:
	text_asm
	ld hl, .Archipelago_Option_Elite_Four_Pokedex_1 + 1
	ld a, [hl]
	cp 0
.Archipelago_Require_Pokedex_D_0 ; turns it into jr .afterDexCheck if off
	jr z, .afterDexCheck
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .afterDexCheck
	ld hl, .noDex
	call PrintText
	jp TextScriptEnd

.afterDexCheck
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ld [wUnusedD71F], a

	ld hl, wObtainedBadges
	ld b, 1
	call CountSetBits
	ld a, [wNumSetBits]
	ld [wUnusedCC5B], a

	farcall GetKeyItemCount
	ld a, [wUnusedD366]

.Archipelago_Option_Elite_Four_Key_Items_1
	cp 0
	jr c, .dontLeave
	ld a, [wUnusedD71F]
.Archipelago_Option_Elite_Four_Pokedex_1
	cp 0
	jr c, .dontLeave
	ld a, [wUnusedCC5B]
.Archipelago_Option_Elite_Four_Badges_1
	cp 0
	jr c, .dontLeave

	ld hl, .badgeGuyText
	call PrintText
	ld hl, .enoughBadges
	call PrintText
	call GBFadeOutToBlack
	ld a, HS_INDIGO_LEAGUE_GUARD
	ld [wMissableObjectIndex], a
	predef HideObject
	call GBFadeInFromBlack
	jp TextScriptEnd

.dontLeave
	ld hl, .badgeGuyText
	call PrintText
	jp TextScriptEnd

.noDex
	text "You need a"
	line "#DEX for me to"
	cont "check that you've"
	cont "met your goal for"
	cont "owned #MON.@"
	text_end

.badgeGuyText
	text "To pass through,"
	line "you need a total"
	cont "of "
.Archipelago_Text_Elite_Four_Badges_0
	db "0 badges,"
.Archipelago_Text_Elite_Four_Key_Items_1
	cont "0 key items, and  "
.Archipelago_Text_Elite_Four_Pokedex_1
	cont "0 #MON    "
	cont "owned."
	para "You have @"
	text_decimal wUnusedCC5B, 1, 1
	text " badges,"
	line "@"
	text_decimal wUnusedD366, 1, 2
	text " key items,"
	cont "and @"
	text_decimal wUnusedD71F, 1, 3
	text " #MON"
	cont "owned."
	prompt

.enoughBadges
	text "Oh, you have met"
	line "your goal!"
	para "OK then! Please,"
	line "go right ahead!@"
	text_end

IndigoCashierText::
.Archipelago_Shop10
	script_mart ULTRA_BALL, GREAT_BALL, FULL_RESTORE, MAX_POTION, FULL_HEAL, REVIVE, MAX_REPEL
	ds 30, 0
