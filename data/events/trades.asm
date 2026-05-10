TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; give mon, get mon, dialog id, nickname
.Archipelago_Trade_Gurio
	db LICKITUNG,  DUGTRIO,  TRADE_DIALOGSET_CASUAL, "GURIO@@@@@@"
.Archipelago_Trade_Miles
	db CLEFAIRY,   MR_MIME,  TRADE_DIALOGSET_CASUAL, "MILES@@@@@@"
.Archipelago_Trade_Stinger
	db BUTTERFREE, BEEDRILL, TRADE_DIALOGSET_HAPPY,  "STINGER@@@@"
.Archipelago_Trade_Sticky
	db KANGASKHAN, MUK,      TRADE_DIALOGSET_CASUAL, "STICKY@@@@@"
.Archipelago_Trade_Bart
	db MEW,        MEW,      TRADE_DIALOGSET_HAPPY,  "BART@@@@@@@"
.Archipelago_Trade_Spike
	db TANGELA,    PARASECT, TRADE_DIALOGSET_CASUAL, "SPIKE@@@@@@"
.Archipelago_Trade_Marty
	db PIDGEOT,    PIDGEOT,  TRADE_DIALOGSET_POLITE, "MARTY@@@@@@"
.Archipelago_Trade_Buffy
	db GOLDUCK,    RHYDON,   TRADE_DIALOGSET_POLITE, "BUFFY@@@@@@"
.Archipelago_Trade_Cezanne
	db GROWLITHE,  DEWGONG,  TRADE_DIALOGSET_HAPPY,  "CEZANNE@@@@"
.Archipelago_Trade_Ricky
	db CUBONE,     MACHOKE,  TRADE_DIALOGSET_HAPPY,  "RICKY@@@@@@"
	assert_table_length NUM_NPC_TRADES
