DisplayOptionMenu_:
	call InitOptionsMenu
.optionMenuLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and START | B_BUTTON
	jr nz, .exitOptionMenu
	call OptionsControl
	jr c, .dpadDelay
	call GetOptionPointer
	jr c, .exitOptionMenu
.dpadDelay
	call OptionsMenu_UpdateCursorPosition
	call DelayFrame
	call DelayFrame
	call DelayFrame
	jr .optionMenuLoop
.exitOptionMenu
	ret

GetOptionPointer:
	ld a, [wOptionsCursorLocation]
	call GetOptionsMenuTableIndex
	ld e, a
	ld d, $0
	ld hl, OptionMenuJumpTable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl ; jump to the function for the current highlighted option

OptionMenuJumpTable:
	dw OptionsMenu_TextSpeed
	dw OptionsMenu_BattleAnimations
	dw OptionsMenu_BattleStyle
	dw OptionsMenu_AutoRun
	dw OptionsMenu_GBPrinterBrightness
	dw OptionsMenu_APItemText
	dw OptionsMenu_SpeakerSettings
	dw OptionsMenu_Cancel

OptionBattleStyleInGame:
.Archipelago_Option_Battle_Style_In_Game_0
	db 0

GetOptionsMenuTableIndex:
	ld d, a
	ld a, [OptionBattleStyleInGame]
	and a
	ld a, d
	ret nz
	cp 2
	ret c
	inc a
	ret

GetOptionsMenuDisplayIndex:
	ld d, a
	ld a, [OptionBattleStyleInGame]
	and a
	ld a, d
	ret nz
	cp 6
	ret nz
	inc a
	ret

GetLastOptionsMenuCursor:
	ld a, [OptionBattleStyleInGame]
	and a
	ld a, 6
	ret z
	ld a, 7
	ret

GetOptionsMenuOptionCount:
	ld a, [OptionBattleStyleInGame]
	and a
	ld c, 6
	ret z
	ld c, 7
	ret

GetOptionsMenuValueCoordX14:
	hlcoord 14, 2
	jr GetOptionsMenuValueCoord

GetOptionsMenuValueCoordX8:
	hlcoord 8, 2

GetOptionsMenuValueCoord:
	ld bc, SCREEN_WIDTH * 2
	ld a, [wOptionsCursorLocation]
	jp AddNTimes

OptionsMenu_TextSpeed:
	ldh a, [hJoy5]
	bit 4, a ; right
	jr nz, .pressedRight
	bit 5, a
	jr nz, .pressedLeft
	jr .display
.pressedRight
	ld a, [wOptions]
	and $f
	inc a
	and $f
	jr .save
.pressedLeft
	ld a, [wOptions]
	and $f
	dec a
	and $f
.save
	ld b, a
	ld a, [wOptions]
	and $f0
	or b
	ld [wOptions], a
.display
	ld a, [wOptions]
	and $f
	push af
	call GetOptionsMenuValueCoordX14
	pop af
	cp 10
	jr c, .singleDigit
	ld [hl], "1"
	inc hl
	sub 10
	add "0"
	ld [hl], a
	jr .done
.singleDigit
	add "0"
	ld [hli], a
	ld [hl], " "
.done
	and a
	ret

OptionsMenu_BattleAnimations:
	ldh a, [hJoy5]
	and D_RIGHT | D_LEFT
	jr nz, .asm_41d33
	ld a, [wOptions]
	and $80 ; mask other bits
	jr .asm_41d3b
.asm_41d33
	ld a, [wOptions]
	xor $80
	ld [wOptions], a
.asm_41d3b
	ld bc, $0
	sla a
	rl c
	ld hl, AnimationOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetOptionsMenuValueCoordX14
	call PlaceString
	and a
	ret

AnimationOptionStringsPointerTable:
	dw AnimationOnText
	dw AnimationOffText

AnimationOnText:
	db "ON @"
AnimationOffText:
	db "OFF@"

OptionsMenu_BattleStyle:
	ldh a, [hJoy5]
	and D_LEFT | D_RIGHT
	jr nz, .asm_41d6b
	ld a, [wOptions]
	and $40 ; mask other bits
	jr .asm_41d73
.asm_41d6b
	ld a, [wOptions]
	xor $40
	ld [wOptions], a
.asm_41d73
	ld bc, $0
	sla a
	sla a
	rl c
	ld hl, BattleStyleOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetOptionsMenuValueCoordX14
	call PlaceString
	and a
	ret

BattleStyleOptionStringsPointerTable:
	dw BattleStyleShiftText
	dw BattleStyleSetText

BattleStyleShiftText:
	db "SHIFT@"
BattleStyleSetText:
	db "SET  @"

OptionsMenu_AutoRun:
	ldh a, [hJoy5]
	and D_RIGHT | D_LEFT
	jr z, .display
	ld a, [wArchipelagoOptions]
	xor 1 << BIT_AUTO_RUN_OFF
	ld [wArchipelagoOptions], a
.display
	ld a, [wArchipelagoOptions]
	and 1 << BIT_AUTO_RUN_OFF
	ld c, 0
	jr z, .gotIndex
	inc c
.gotIndex
	ld b, 0
	ld hl, AnimationOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetOptionsMenuValueCoordX14
	call PlaceString
	and a
	ret

OptionsMenu_SpeakerSettings:
	ld a, [wOptions]
	and $30
	swap a
	ld c, a
	ldh a, [hJoy5]
	bit 4, a
	jr nz, .pressedRight
	bit 5, a
	jr nz, .pressedLeft
	jr .asm_41dca
.pressedRight
	ld a, c
	inc a
	and $3
	jr .asm_41dba
.pressedLeft
	ld a, c
	dec a
	and $3
.asm_41dba
	ld c, a
	swap a
	ld b, a
	xor a
	ldh [rNR51], a
	ld a, [wOptions]
	and $cf
	or b
	ld [wOptions], a
.asm_41dca
	ld b, $0
	ld hl, SpeakerOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetOptionsMenuValueCoordX8
	call PlaceString
	and a
	ret

SpeakerOptionStringsPointerTable:
	dw MonoSoundText
	dw Earphone1SoundText
	dw Earphone2SoundText
	dw Earphone3SoundText

MonoSoundText:
	db "MONO     @"
Earphone1SoundText:
	db "EARPHONE1@"
Earphone2SoundText:
	db "EARPHONE2@"
Earphone3SoundText:
	db "EARPHONE3@"

OptionsMenu_GBPrinterBrightness:
	call Func_41e7b
	ldh a, [hJoy5]
	bit 4, a
	jr nz, .pressedRight
	bit 5, a
	jr nz, .pressedLeft
	jr .asm_41e32
.pressedRight
	ld a, c
	cp $4
	jr c, .asm_41e22
	ld c, $ff
.asm_41e22
	inc c
	ld a, e
	jr .asm_41e2e
.pressedLeft
	ld a, c
	and a
	jr nz, .asm_41e2c
	ld c, $5
.asm_41e2c
	dec c
	ld a, d
.asm_41e2e
	ld b, a
	ld [wPrinterSettings], a
.asm_41e32
	ld b, $0
	ld hl, GBPrinterOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetOptionsMenuValueCoordX8
	call PlaceString
	and a
	ret

GBPrinterOptionStringsPointerTable:
	dw LightestPrintText
	dw LighterPrintText
	dw NormalPrintText
	dw DarkerPrintText
	dw DarkestPrintText

LightestPrintText:
	db "LIGHTEST@"
LighterPrintText:
	db "LIGHTER @"
NormalPrintText:
	db "NORMAL  @"
DarkerPrintText:
	db "DARKER  @"
DarkestPrintText:
	db "DARKEST @"

OptionsMenu_APItemText:
	ldh a, [hJoy5]
	and D_RIGHT | D_LEFT
	jr z, .display
	ld a, [wArchipelagoOptions]
	xor 1 << BIT_AP_ITEM_TEXT_OFF
	ld [wArchipelagoOptions], a
.display
	ld a, [wArchipelagoOptions]
	and 1 << BIT_AP_ITEM_TEXT_OFF
	ld c, 0
	jr z, .gotIndex
	inc c
.gotIndex
	ld b, 0
	ld hl, AnimationOptionStringsPointerTable
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetOptionsMenuValueCoordX14
	call PlaceString
	and a
	ret

Func_41e7b:
	ld a, [wPrinterSettings]
	and a
	jr z, .asm_41e93
	cp $20
	jr z, .asm_41e99
	cp $60
	jr z, .asm_41e9f
	cp $7f
	jr z, .asm_41ea5
	ld c, $2
	lb de, $20, $60
	ret
.asm_41e93
	ld c, $0
	lb de, $7f, $20
	ret
.asm_41e99
	ld c, $1
	lb de, $0, $40
	ret
.asm_41e9f
	ld c, $3
	lb de, $40, $7f
	ret
.asm_41ea5
	ld c, $4
	lb de, $60, $0
	ret

OptionsMenu_Dummy:
	and a
	ret

OptionsMenu_Cancel:
	ldh a, [hJoy5]
	and A_BUTTON
	jr nz, .pressedCancel
	and a
	ret
.pressedCancel
	scf
	ret

OptionsControl:
	ld hl, wOptionsCursorLocation
	ldh a, [hJoy5]
	cp D_DOWN
	jr z, .pressedDown
	cp D_UP
	jr z, .pressedUp
	and a
	ret
.pressedDown
	call GetLastOptionsMenuCursor
	ld b, a
	ld a, [hl]
	cp b
	jr nz, .doNotWrapAround
	ld [hl], $0
	scf
	ret
.doNotWrapAround
	inc [hl]
	scf
	ret
.pressedUp
	ld a, [hl]
	and a
	jr nz, .regularDecrement
	call GetLastOptionsMenuCursor
	inc a
	ld [hl], a
.regularDecrement
	dec [hl]
	scf
	ret

OptionsMenu_UpdateCursorPosition:
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, 16
.loop
	ld [hl], " "
	add hl, de
	dec c
	jr nz, .loop
	hlcoord 1, 2
	ld bc, SCREEN_WIDTH * 2
	ld a, [wOptionsCursorLocation]
	call GetOptionsMenuDisplayIndex
	call AddNTimes
	ld [hl], "▶"
	ret

InitOptionsMenu:
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call TextBoxBorder
	hlcoord 2, 2
	ld a, [OptionBattleStyleInGame]
	and a
	ld de, AllOptionsText
	jr nz, .gotOptionsText
	ld de, AllOptionsTextNoBattleStyle
.gotOptionsText
	call PlaceString
	hlcoord 2, 16
	ld de, OptionMenuCancelText
	call PlaceString
	xor a
	ld [wOptionsCursorLocation], a
	call GetOptionsMenuOptionCount
.loop
	push bc
	call GetOptionPointer ; updates the next option
	pop bc
	ld hl, wOptionsCursorLocation
	inc [hl] ; moves the cursor for the highlighted option
	dec c
	jr nz, .loop
	xor a
	ld [wOptionsCursorLocation], a
	inc a
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	ret

AllOptionsText:
	db "TEXT SPEED :"
	next "ANIMATION  :"
	next "BATTLESTYLE:"
	next "AUTO RUN   :"
	next "PRINT:"
	next "AP TEXT    :"
	next "SOUND:@"

AllOptionsTextNoBattleStyle:
	db "TEXT SPEED :"
	next "ANIMATION  :"
	next "AUTO RUN   :"
	next "PRINT:"
	next "AP TEXT    :"
	next "SOUND:@"

OptionMenuCancelText:
	db "CANCEL@"
