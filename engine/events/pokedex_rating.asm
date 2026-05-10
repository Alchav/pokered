DisplayDexRating:
	call CheckMissingTrainersanity
	call CheckAllDexSanity

	ld hl, wPokedexSeen
	ld b, wPokedexSeenEnd - wPokedexSeen
	call CountSetBits
	ld a, [wNumSetBits]
	ldh [hDexRatingNumMonsSeen], a
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ldh [hDexRatingNumMonsOwned], a
	ld hl, DexRatingsTable
.findRating
	ld a, [hli]
	ld b, a
	ldh a, [hDexRatingNumMonsOwned]
	cp b
	jr c, .foundRating
	inc hl
	inc hl
	jr .findRating
.foundRating
	ld a, [hli]
	ld h, [hl]
	ld l, a ; load text pointer into hl
	CheckAndResetEventA EVENT_HALL_OF_FAME_DEX_RATING
	jr nz, .hallOfFame
	push hl
	ld hl, DexCompletionText
	call PrintText
	pop hl
	call PrintText
	farcall PlayPokedexRatingSfx
	jp WaitForTextScrollButtonPress
.hallOfFame
	ld de, wDexRatingNumMonsSeen
	ldh a, [hDexRatingNumMonsSeen]
	ld [de], a
	inc de
	ldh a, [hDexRatingNumMonsOwned]
	ld [de], a
	inc de
.copyRatingTextLoop
	ld a, [hli]
	cp "@"
	jr z, .doneCopying
	ld [de], a
	inc de
	jr .copyRatingTextLoop
.doneCopying
	ld [de], a
	ret

DexCompletionText:
	text_far _DexCompletionText
	text_end

DexRatingsTable:
	dbw 10, DexRatingText_Own0To9
	dbw 20, DexRatingText_Own10To19
	dbw 30, DexRatingText_Own20To29
	dbw 40, DexRatingText_Own30To39
	dbw 50, DexRatingText_Own40To49
	dbw 60, DexRatingText_Own50To59
	dbw 70, DexRatingText_Own60To69
	dbw 80, DexRatingText_Own70To79
	dbw 90, DexRatingText_Own80To89
	dbw 100, DexRatingText_Own90To99
	dbw 110, DexRatingText_Own100To109
	dbw 120, DexRatingText_Own110To119
	dbw 130, DexRatingText_Own120To129
	dbw 140, DexRatingText_Own130To139
	dbw 150, DexRatingText_Own140To149
	dbw NUM_POKEMON + 1, DexRatingText_Own150To151

DexRatingText_Own0To9:
	text_far _DexRatingText_Own0To9
	text_end

DexRatingText_Own10To19:
	text_far _DexRatingText_Own10To19
	text_end

DexRatingText_Own20To29:
	text_far _DexRatingText_Own20To29
	text_end

DexRatingText_Own30To39:
	text_far _DexRatingText_Own30To39
	text_end

DexRatingText_Own40To49:
	text_far _DexRatingText_Own40To49
	text_end

DexRatingText_Own50To59:
	text_far _DexRatingText_Own50To59
	text_end

DexRatingText_Own60To69:
	text_far _DexRatingText_Own60To69
	text_end

DexRatingText_Own70To79:
	text_far _DexRatingText_Own70To79
	text_end

DexRatingText_Own80To89:
	text_far _DexRatingText_Own80To89
	text_end

DexRatingText_Own90To99:
	text_far _DexRatingText_Own90To99
	text_end

DexRatingText_Own100To109:
	text_far _DexRatingText_Own100To109
	text_end

DexRatingText_Own110To119:
	text_far _DexRatingText_Own110To119
	text_end

DexRatingText_Own120To129:
	text_far _DexRatingText_Own120To129
	text_end

DexRatingText_Own130To139:
	text_far _DexRatingText_Own130To139
	text_end

DexRatingText_Own140To149:
	text_far _DexRatingText_Own140To149
	text_end

DexRatingText_Own150To151:
	text_far _DexRatingText_Own150To151
	text_end

DexSanityItems:
.Archipelago_Dexsanity_Items
	ds 151, $00

receivedDexItem:
	text "<PLAYER> received "
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

TrainersanityBagFullText:
	text "You can't carry"
	line "any more items."
	done

CheckForTrainersanityItem::
	ld a, [wEndBattleTrainersanityItem]
	and a
	jr z, .noItem
	push af
	ld a, [wEndBattleTrainersanityFlagByte]
	ld l, a
	ld a, [wEndBattleTrainersanityFlagByte + 1]
	ld h, a
	ld a, [wEndBattleTrainersanityFlagBit]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	pop af
	jr nz, .noItem
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .bagFull
	ld a, [wEndBattleTrainersanityFlagByte]
	ld l, a
	ld a, [wEndBattleTrainersanityFlagByte + 1]
	ld h, a
	ld a, [wEndBattleTrainersanityFlagBit]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	ld hl, DisplayArchipelagoItem
	call PrintText
	xor a
	ld [wEndBattleTrainersanityItem], a
	scf
	ret
.bagFull
	ld hl, TrainersanityBagFullText
	call PrintText
.noItem
	xor a
	ld [wEndBattleTrainersanityItem], a
	and a
	ret

EventBattleTrainersanityDataStart:
	EventBattleTrainersanityDataAlias EVENT_BATTLED_RIVAL_IN_OAKS_LAB_ITEM, EVENT_BATTLED_RIVAL_IN_OAKS_LAB, EVENT_BEAT_LAB_RIVAL_ITEM
	EventBattleTrainersanityData EVENT_BEAT_CERULEAN_RIVAL_ITEM, EVENT_BEAT_CERULEAN_RIVAL
	EventBattleTrainersanityData EVENT_BEAT_SILPH_CO_GIOVANNI_ITEM, EVENT_BEAT_SILPH_CO_GIOVANNI
	EventBattleTrainersanityData EVENT_BEAT_CERULEAN_ROCKET_THIEF_ITEM, EVENT_BEAT_CERULEAN_ROCKET_THIEF
	EventBattleTrainersanityData EVENT_DEFEATED_FIGHTING_DOJO_ITEM, EVENT_DEFEATED_FIGHTING_DOJO
	EventBattleTrainersanityDataAlias EVENT_FOUND_ROCKET_HIDEOUT_ITEM, EVENT_FOUND_ROCKET_HIDEOUT, EVENT_BEAT_GAME_CORNER_ROCKET_ITEM
	EventBattleTrainersanityData EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD_ITEM, EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	EventBattleTrainersanityData EVENT_BEAT_MT_MOON_3_TRAINER_0_ITEM, EVENT_BEAT_MT_MOON_3_TRAINER_0
	EventBattleTrainersanityData EVENT_BEAT_POKEMON_TOWER_RIVAL_ITEM, EVENT_BEAT_POKEMON_TOWER_RIVAL
	EventBattleTrainersanityData EVENT_BEAT_POKEMONTOWER_7_TRAINER_0_ITEM, EVENT_BEAT_POKEMONTOWER_7_TRAINER_0
	EventBattleTrainersanityData EVENT_BEAT_SILPH_CO_RIVAL_ITEM, EVENT_BEAT_SILPH_CO_RIVAL
	EventBattleTrainersanityData EVENT_BEAT_RIVAL_SS_ANNE_ITEM, EVENT_BEAT_RIVAL_SS_ANNE
	EventBattleTrainersanityData EVENT_BEAT_ROUTE22_RIVAL_1ST_BATTLE_ITEM, EVENT_BEAT_ROUTE22_RIVAL_1ST_BATTLE
	EventBattleTrainersanityData EVENT_BEAT_ROUTE22_RIVAL_2ND_BATTLE_ITEM, EVENT_BEAT_ROUTE22_RIVAL_2ND_BATTLE
	EventBattleTrainersanityData EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI_ITEM, EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	EventBattleTrainersanityData EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0_ITEM, EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0
	EventBattleTrainersanityDataAlias EVENT_GOT_NUGGET_ITEM, EVENT_GOT_NUGGET, EVENT_BEAT_ROUTE_24_LEADER_ITEM
	EventBattleTrainersanityData EVENT_BEAT_ROUTE24_ROCKET_ITEM, EVENT_BEAT_ROUTE24_ROCKET
	EventBattleTrainersanityData EVENT_BEAT_SILPH_CO_11F_TRAINER_0_ITEM, EVENT_BEAT_SILPH_CO_11F_TRAINER_0
	EventBattleTrainersanityData EVENT_BEAT_BROCK_ITEM, EVENT_BEAT_BROCK
	EventBattleTrainersanityData EVENT_BEAT_MISTY_ITEM, EVENT_BEAT_MISTY
	EventBattleTrainersanityData EVENT_BEAT_LT_SURGE_ITEM, EVENT_BEAT_LT_SURGE
	EventBattleTrainersanityData EVENT_BEAT_ERIKA_ITEM, EVENT_BEAT_ERIKA
	EventBattleTrainersanityData EVENT_BEAT_KOGA_ITEM, EVENT_BEAT_KOGA
	EventBattleTrainersanityData EVENT_BEAT_SABRINA_ITEM, EVENT_BEAT_SABRINA
	EventBattleTrainersanityData EVENT_BEAT_BLAINE_ITEM, EVENT_BEAT_BLAINE
	EventBattleTrainersanityData EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI_ITEM, EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	EventBattleTrainersanityDataAlias EVENT_BEAT_CINNABAR_GYM_TRAINER_0_ITEM, EVENT_BEAT_CINNABAR_GYM_TRAINER_0, EVENT_BEAT_CINNABAR_GYM_TRAINER_A_ITEM
	EventBattleTrainersanityDataAlias EVENT_BEAT_CINNABAR_GYM_TRAINER_1_ITEM, EVENT_BEAT_CINNABAR_GYM_TRAINER_1, EVENT_BEAT_CINNABAR_GYM_TRAINER_B_ITEM
	EventBattleTrainersanityData EVENT_BEAT_CINNABAR_GYM_TRAINER_2_ITEM, EVENT_BEAT_CINNABAR_GYM_TRAINER_2
	EventBattleTrainersanityData EVENT_BEAT_CINNABAR_GYM_TRAINER_3_ITEM, EVENT_BEAT_CINNABAR_GYM_TRAINER_3
	EventBattleTrainersanityData EVENT_BEAT_CINNABAR_GYM_TRAINER_4_ITEM, EVENT_BEAT_CINNABAR_GYM_TRAINER_4
	EventBattleTrainersanityData EVENT_BEAT_CINNABAR_GYM_TRAINER_5_ITEM, EVENT_BEAT_CINNABAR_GYM_TRAINER_5
	EventBattleTrainersanityData EVENT_BEAT_CINNABAR_GYM_TRAINER_6_ITEM, EVENT_BEAT_CINNABAR_GYM_TRAINER_6
	db $ff

LoadEventBattleTrainersanityData::
	ld de, wEndBattleTrainersanityItem
	ld bc, 4
	jp CopyData

CheckMissingTrainersanity::
	ld hl, EventBattleTrainersanityDataStart
.loop
	ld a, [hli]
	cp $ff
	ret z
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	push hl
	ld h, d
	ld l, e
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	jr z, .trainerNotBeaten
	pop hl
	ld bc, 4
	ld de, wEndBattleTrainersanityItem
	call CopyData
	push hl
	call CheckForTrainersanityItem
	pop hl
	jr .loop
.trainerNotBeaten
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	jr .loop

CheckAllDexSanity::
.Archipelago_Option_Dexsanity_A_1
	ld a, 0
	and a
	ret z
.Archipelago_Require_Pokedex_B_1
	ld a, 0
	and a
	jr z, .skipDexCheck
	CheckEvent EVENT_GOT_POKEDEX
	ret z
.skipDexCheck

	xor a
	ld c, 255

.loop
	inc c
	ld a, c
	cp 152
	ret z
	ld hl, wPokedexOwned
	ld b, FLAG_TEST
	push bc
	predef FlagActionPredef
	ld a, c
	pop bc
	and a
	jr z, .loop
	ld hl, wDexSanity
	ld b, FLAG_TEST
	push bc
	predef FlagActionPredef
	ld a, c
	pop bc
	and a
	jr nz, .loop
	ld b, 0
	ld hl, DexSanityItems
	add hl, bc
	push bc
	ld a, [hl]

	and a
	jr z, .nextLoop

	ld b, a
	ld c, 1

	call GiveItem
	jr nc, .bagFull
	ld hl, receivedDexItem
	call PrintText
	call WaitForTextScrollButtonPress

	pop bc
	push bc
	ld b, FLAG_SET
	ld hl, wDexSanity
	predef FlagActionPredef
.nextLoop
	pop bc
	jr .loop
.bagFull
	pop bc
	ret

registerDexSanity::
.Archipelago_Option_Dexsanity_B_1
	ld a, 0
	and a
	ret z
.Archipelago_Require_Pokedex_C_1
	ld a, 0
	and a
	jr z, .skipDexCheck
	CheckEvent EVENT_GOT_POKEDEX
	ret z
.skipDexCheck
	ld a, [wd11e]
	dec a
	ld c, a
	ld hl, wDexSanity
	ld b, FLAG_TEST
	push bc
	predef FlagActionPredef
	ld a, c
	and a
	jr z, .continue
	pop bc
	ret
.continue
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, 0
	ld hl, DexSanityItems
	add hl, bc
	ld a, [hl]

	and a
	jr z, .noItem

	ld b, a
	ld c, 1
	call GiveItem
	jr c, .bagNotFull
.noItem
	pop bc
	ret
.bagNotFull
	ld hl, receivedDexItem
	call PrintText
	call WaitForTextScrollButtonPress
	pop bc
	ld b, FLAG_SET
	ld hl, wDexSanity
	predef FlagActionPredef
	ret

wball:
	db "<wball>@"

DexSanityIconCheck::
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, 0
	ld hl, DexSanityItems
	add hl, bc
	ld a, [hl]
	and a
	ret z
	hlcoord 1, 1
	ld de, wball
	jp PlaceString

DexSanityIconCheckPokedex::
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, 0
	ld hl, DexSanityItems
	add hl, bc
	ld a, [hl]
	and a
	ret
