DisplayEffectiveness:
;.Archipelago_Option_Mystery_Types_1
;	ld a, 0
;	and a
;	ret nz
;	ld a, [wDamageMultipliers]
;	and $7F
;	cp $0A
;	ret z

	ld a, [wEffectiveMessage]
	cp 1
	ret c
	ld hl, SuperEffectiveText
	jr nz, .done
	ld hl, NotVeryEffectiveText
.done
	xor a
	ld [wEffectiveMessage], a
	jp PrintText

SuperEffectiveText:
	text_far _SuperEffectiveText
	text_end

NotVeryEffectiveText:
	text_far _NotVeryEffectiveText
	text_end
