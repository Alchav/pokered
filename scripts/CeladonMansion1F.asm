CeladonMansion1F_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonMansion1F_TextPointers:
	dw CeladonMansion1Text1
	dw CeladonMansion1Text2
	dw CeladonMansion1Text3
	dw CeladonMansion1Text4
	dw CeladonMansion1Text5

CeladonMansion1Text1:
	text_far _CeladonMansion1Text1
	text_asm
	ld a, MEOWTH
	call PlayCry
	jp TextScriptEnd

CeladonMansion1Text2:
	text_asm
.Archipelago_Option_Tea_1
	ld a, 0
	and a
	jr z, .proceed
	CheckEvent EVENT_GOT_TEA
	jr nz, .proceed
.Archipelago_Event_Mansion_Lady
	lb bc, TEA, 1
	call GiveItem
	jr nc, .bagFull
	ld hl, CeladonMansion1ReceivedTeaText
	call PrintText
	SetEvent EVENT_GOT_TEA
	jp TextScriptEnd
.bagFull
	ld hl, CeladonMansion1TextNoRoom
	call PrintText
	jp TextScriptEnd
.proceed
	farcall Func_f1e70
	ld a, [wPikachuHappiness]
	cp 251
	jr c, .asm_485d9
	ld c, 50
	call DelayFrames
	ldpikacry e, PikachuCry23
	callfar PlayPikachuSoundClip
.asm_485d9
	jp TextScriptEnd

CeladonMansion1ReceivedTeaText:
	text_far _ReceivedTM27Text
	sound_get_item_1
	text_end

CeladonMansion1TextNoRoom:
	text_far _FuchsiaHouse3Text_5621c
	text_end

CeladonMansion1Text3:
	text_far _CeladonMansion1Text3
	text_asm
	ld a, CLEFAIRY
	call PlayCry
	jp TextScriptEnd

CeladonMansion1Text4:
	text_far _CeladonMansion1Text4
	text_asm
	ld a, NIDORAN_F
	call PlayCry
	jp TextScriptEnd

CeladonMansion1Text5:
	text_far _CeladonMansion1Text5
	text_end
