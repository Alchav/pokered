Func_f1b73::
	ld a, [wd72e]
	bit 3, a ; received a Pokémon from Oak?
	jp nz, MomHealPokemon
	ld hl, MomWakeUpText
	call PrintText
	ret

MomWakeUpText:
	text_far _MomWakeUpText
	text_end

MomHealPokemon:
	ld b, ULTRA_BALL
	call IsItemInBag
	jr nz, .noGift
	ld b, GREAT_BALL
	call IsItemInBag
	jr nz, .noGift
	ld b, POKE_BALL
	call IsItemInBag
	jr nz, .noGift
	ld a, [wPlayerMoney]
	cp 1
	jr nc, .noGift
	ld a, [wPlayerMoney + 1]
	cp 2
	jr nc, .noGift
	ld a, HS_LYING_OLD_MAN
	ld c, a
	ld b, FLAG_TEST
	ld hl, wMissableObjectFlags
	farcall MissableObjectFlagAction
	ld a, c
	and a
	jr z, .noGift
	lb bc, POKE_BALL, 1
	call GiveItem
	jr nc, .noGift
	ld hl, PokeballGiftText
	jp PrintText
.noGift
	ld hl, MomHealText1
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, [wAudioROMBank]
	cp BANK("Audio Engine 3")
	ld [wAudioSavedROMBank], a
	jr nz, .next
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	ld a, BANK(Music_PkmnHealed)
	ld [wAudioROMBank], a
.next
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlaySound
.loop
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .loop
	xor a
	ld [wAudioFadeOutControl], a
	ld a, [wAudioSavedROMBank]
	ld [wAudioROMBank], a
	ld a, [wMapMusicSoundID]
	ld [wLastMusicSoundID], a
	ld [wNewSoundID], a
	call PlaySound
	call GBFadeInFromWhite
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	cp 50
	jr c, .normalText
	ld hl, MomHealText3
	jp PrintText
.normalText
	ld hl, MomHealText2
	call PrintText
	ret

PokeballGiftText:
	text "<PLAYER> received "
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

MomHealText1:
	text_far _MomHealText1
	text_end
MomHealText2:
	text_far _MomHealText2
	text_end
MomHealText3:
	text_far _MomHealText3
	text_end

Func_f1bc4::
	ld hl, TVWrongSideText
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jp nz, .got_text
	ld hl, StandByMeText
.got_text
	call PrintText
	ret

StandByMeText:
	text_far _StandByMeText
	text_end

TVWrongSideText:
	text_far _TVWrongSideText
	text_end
