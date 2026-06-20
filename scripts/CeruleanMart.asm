CeruleanMart_Script:
	jp EnableAutoTextBoxDrawing

CeruleanMart_TextPointers:
	dw CeruleanCashierText
	dw CeruleanMartText2
	dw CeruleanMartText3

CeruleanCashierText::
.Archipelago_Shop3
	script_mart POKE_BALL, POTION, ESCAPE_ROPE, REPEL, ANTIDOTE, BURN_HEAL, AWAKENING, PARLYZ_HEAL
	ds 30, 0

CeruleanMartText2:
	text_far _CeruleanMartText2
	text_end

CeruleanMartText3:
	text_far _CeruleanMartText3
	text_end
