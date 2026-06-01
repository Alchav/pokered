CeruleanMelaniesHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

CeruleanMelaniesHouse_TextPointers:
	dw CeruleanHouse1Text1
	dw CeruleanHouse1Text2
	dw CeruleanHouse1Text3
	dw CeruleanHouse1Text4

CeruleanHouse1Text1:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	CheckEvent EVENT_GOT_BULBASAUR_IN_CERULEAN
	jr nz, .asm_1cfbf
	call LoadMelanieGiftMonName
	ld hl, CeruleanHouse1Text_1cfc8
	call PrintText
	ld a, [wPikachuHappiness]
	cp 147
	jr c, .asm_1cfb3
	call LoadMelanieGiftMonName
	ld hl, CeruleanHouse1Text_1cfce
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_1cfb6
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call LoadMelanieGiftMonName
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
.Archipelago_Gift_Bulbasaur_2
	lb bc, BULBASAUR, 10
	call GivePokemon
	jr nc, .asm_1cfb3
	ld a, [wAddedToParty]
	and a
	call z, WaitForTextScrollButtonPress
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, CeruleanHouse1Text_1cfd3
	call PrintText
	ld a, HS_CERULEAN_BULBASAUR
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_BULBASAUR_IN_CERULEAN
.asm_1cfb3
	jp TextScriptEnd

.asm_1cfb6
	ld hl, CeruleanHouse1Text_1cfdf
	call PrintText
	jp TextScriptEnd

.asm_1cfbf
	call LoadMelanieGiftMonName
	ld hl, CeruleanHouse1Text_1cfd9
	call PrintText
	jp TextScriptEnd

CeruleanHouse1Text_1cfc8:
	text_far MelanieText1
	text_waitbutton
	text_end

CeruleanHouse1Text_1cfce:
	text_far MelanieText2
	text_end

CeruleanHouse1Text_1cfd3:
	text_far MelanieText3
	text_waitbutton
	text_end

CeruleanHouse1Text_1cfd9:
	text_far MelanieText4
	text_waitbutton
	text_end

CeruleanHouse1Text_1cfdf:
	text_far MelanieText5
	text_waitbutton
	text_end

CeruleanHouse1Text2:
	text_asm
	call LoadMelanieGiftMonName
	ld a, [wcf91]
	push af
	ld hl, CeruleanHouse1Text_1cfe5
	call PrintText
	pop af
	call PlayCry
	jp TextScriptEnd

CeruleanHouse1Text3:
	text_far MelanieOddishText
	text_asm
	ld a, ODDISH
	call PlayCry
	jp TextScriptEnd

CeruleanHouse1Text4:
	text_far MelanieSandshrewText
	text_asm
	ld a, SANDSHREW
	call PlayCry
	jp TextScriptEnd

LoadMelanieGiftMonName:
.Archipelago_Gift_Bulbasaur_Name_1
	ld a, BULBASAUR
	ld [wd11e], a
	ld [wcf91], a
	jp GetMonName

CeruleanHouse1Text_1cfe5:
	text_far MelanieBulbasaurText
	text_end
