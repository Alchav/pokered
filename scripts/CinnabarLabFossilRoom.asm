CinnabarLabFossilRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabFossilRoom_TextPointers:
	dw Lab4Text1
	dw Lab4Text2
	dw ShopPC
	dw HelixShop
	dw DomeShop
	dw HelixDomeShop
	dw AmberShop
	dw HelixAmberShop
	dw DomeAmberShop
	dw AllFossilsShop
	dw NoFossils

Lab4Script_GetFossilsInBag:
; construct a list of all fossils in the player's bag
	xor a
	ld [wFilteredBagItemsCount], a
	ld de, wFilteredBagItems
	ld hl, FossilsList
.loop
	ld a, [hli]
	and a
	jr z, .done
	push hl
	push de
	ld [wd11e], a
	ld b, a
	predef GetQuantityOfItemInBag
	pop de
	pop hl
	ld a, b
	and a
	jr z, .loop

	; A fossil's in the bag
	ld a, [wd11e]
	ld [de], a
	inc de
	push hl
	ld hl, wFilteredBagItemsCount
	inc [hl]
	pop hl
	jr .loop
.done
	ld a, $ff
	ld [de], a
	ret

FossilsList:
	db DOME_FOSSIL
	db HELIX_FOSSIL
	db OLD_AMBER
	db 0 ; end

Lab4Text1:
	text_asm
	ld a, [wFossilsRevived]
.Archipelago_Fossils_Needed_For_Second_Item_1
	cp 3
	jr c, .proceed
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	jr z, .checkDome
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .proceed
	jr .Archipelago_Event_Dome_Fossil_B
.checkDome
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jp nz, .Archipelago_Event_Helix_Fossil_B
.proceed
	CheckEvent EVENT_GAVE_FOSSIL_TO_LAB
	jr nz, .asm_75d96
	ld hl, Lab4Text_75dc6
	call PrintText
	call Lab4Script_GetFossilsInBag
	ld a, [wFilteredBagItemsCount]
	and a
	jr z, .asm_75d8d
	farcall GiveFossilToCinnabarLab
	jr .asm_75d93
.asm_75d8d
	ld hl, Lab4Text_75dcb
	call PrintText
.asm_75d93
	jp TextScriptEnd
.asm_75d96
	CheckEventAfterBranchReuseA EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_GAVE_FOSSIL_TO_LAB
	jr z, .asm_75da2
	ld hl, Lab4Text_75dd0
	call PrintText
	jr .asm_75d93
.asm_75da2
	call LoadFossilItemAndMonNameBank1D
	ld hl, Lab4Text_75dd5
	call PrintText
	SetEvent EVENT_LAB_HANDING_OVER_FOSSIL_MON
	ld a, [wFossilMon]
	ld b, a
.Archipelago_Fossil_Level_1
	ld c, 30
	call GivePokemon
	jr nc, .asm_75d93
	ResetEvents EVENT_GAVE_FOSSIL_TO_LAB, EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_LAB_HANDING_OVER_FOSSIL_MON
	ld a, [wFossilsRevived]
	inc a
	ld [wFossilsRevived], a
	jr .asm_75d93
.Archipelago_Event_Dome_Fossil_B
	lb bc, DOME_FOSSIL, 1
	call GiveItem
	jr c, .notFullDome
	ld hl, LabBagFull
	call PrintText
	jp TextScriptEnd
.notFullDome
	ld hl, LabRecItem
	call PrintText
	SetEvent EVENT_GOT_DOME_FOSSIL
	jp TextScriptEnd
.Archipelago_Event_Helix_Fossil_B
	lb bc, HELIX_FOSSIL, 1
	call GiveItem
	jr c, .notFullHelix
	ld hl, LabBagFull
	call PrintText
	jp TextScriptEnd
.notFullHelix
	ld hl, LabRecItem
	call PrintText
	SetEvent EVENT_GOT_HELIX_FOSSIL
	jp TextScriptEnd

LabRecItem:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

LabBagFull:
	text "You can't carry"
	line "any more items."
	done

Lab4Text_75dc6:
	text_far _Lab4Text_75dc6
	text_end

Lab4Text_75dcb:
	text_far _Lab4Text_75dcb
	text_end

Lab4Text_75dd0:
	text_far _Lab4Text_75dd0
	text_end

Lab4Text_75dd5:
	text_far _Lab4Text_75dd5
	text_end

Lab4Text2:
	text_asm
	ld a, TRADE_FOR_SAILOR
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

LoadFossilItemAndMonNameBank1D:
	farjp LoadFossilItemAndMonName

ShopPC:
	text_asm
	ld b, 0
	CheckEvent EVENT_GAVE_OLD_AMBER, 1
	rl b
	CheckEvent EVENT_GAVE_DOME_FOSSIL, 1
	rl b
	CheckEvent EVENT_GAVE_HELIX_FOSSIL, 1
	rl b
	ld a, b
	add 3
	cp 3
	jr z, .zero
.continue
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call DisableWaitingAfterTextDisplay
	jp TextScriptEnd
.zero
	ld a, 11
	jr .continue

HelixShop:
	script_mart HELIX_FOSSIL

DomeShop:
	script_mart DOME_FOSSIL

HelixDomeShop:
	script_mart HELIX_FOSSIL, DOME_FOSSIL

AmberShop:
	script_mart OLD_AMBER

HelixAmberShop:
	script_mart HELIX_FOSSIL, OLD_AMBER

DomeAmberShop:
	script_mart DOME_FOSSIL, OLD_AMBER

AllFossilsShop:
	script_mart HELIX_FOSSIL, DOME_FOSSIL, OLD_AMBER

NoFossils:
	text "I can duplicate"
	line "fossils after"
	cont "you provide us"
	cont "with them!"
	done
