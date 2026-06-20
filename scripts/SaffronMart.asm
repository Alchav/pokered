SaffronMart_Script:
	jp EnableAutoTextBoxDrawing

SaffronMart_TextPointers:
	dw SaffronCashierText
	dw SaffronMartText2
	dw SaffronMartText3

SaffronCashierText::
.Archipelago_Shop9
	script_mart GREAT_BALL, HYPER_POTION, MAX_REPEL, ESCAPE_ROPE, FULL_HEAL, REVIVE
	ds 30, 0

SaffronMartText2:
	text_far _SaffronMartText2
	text_end

SaffronMartText3:
	text_far _SaffronMartText3
	text_end
