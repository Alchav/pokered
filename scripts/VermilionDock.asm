VermilionDock_Script:
	call EnableAutoTextBoxDrawing
	ld hl, VermilionDockTrainerHeaders
	ld de, VermilionDock_ScriptPointers
	ld a, [wVermilionDockScript]
	call ExecuteCurMapScriptInTable
	ld [wVermilionDockScript], a
	ret

VermilionDock_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VermilionDock_TextPointers:
	dw MewText

VermilionDockTrainerHeaders:
	def_trainers
MewTrainerHeader:
	trainer EVENT_BEAT_MEW, 0, MewBattleText, MewBattleText, MewBattleText
	db -1 ; end

MewText:
	text_asm
	ld hl, MewTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MewBattleText:
	text "Mew!@"
	text_asm
	ld a, MEW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
