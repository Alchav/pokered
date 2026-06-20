FuchsiaMart_Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaMart_TextPointers:
	dw FuchsiaCashierText
	dw FuchsiaMartText2
	dw FuchsiaMartText3

FuchsiaCashierText::
.Archipelago_Shop7
	script_mart ULTRA_BALL, GREAT_BALL, HYPER_POTION, REVIVE, FULL_HEAL, SUPER_REPEL
	ds 30, 0

FuchsiaMartText2:
	text_far _FuchsiaMartText2
	text_end

FuchsiaMartText3:
	text_far _FuchsiaMartText3
	text_end
