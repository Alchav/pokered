; Boolean checks
DEF FALSE EQU 0
DEF TRUE  EQU 1

; flag operations
	const_def
	const FLAG_RESET ; 0
	const FLAG_SET   ; 1
	const FLAG_TEST  ; 2

; wOptions
DEF TEXT_DELAY_MASK     EQU %00001111
DEF SOUND_MASK          EQU %00110000
DEF TEXT_DELAY_FAST    EQU %001 ; 1
DEF TEXT_DELAY_MEDIUM  EQU %011 ; 3
DEF TEXT_DELAY_SLOW    EQU %101 ; 5

	const_def 6
	const BIT_BATTLE_SHIFT     ; 6
	const BIT_BATTLE_ANIMATION ; 7

; wArchipelagoOptions
	const_def
	const BIT_AP_ITEM_TEXT_OFF ; 0
	const BIT_AUTO_RUN_OFF     ; 1
