INCLUDE "constants.asm"


SECTION "bank1", ROMX

INCLUDE "data/sprites/facings.asm"
INCLUDE "engine/battle/safari_zone.asm"
INCLUDE "engine/movie/title.asm"
INCLUDE "engine/pokemon/load_mon_data.asm"
INCLUDE "data/items/prices.asm"
INCLUDE "data/items/names.asm"
INCLUDE "data/text/unused_names.asm"
INCLUDE "engine/gfx/sprite_oam.asm"
INCLUDE "engine/link/print_waiting_text.asm"
INCLUDE "engine/overworld/sprite_collisions.asm"
INCLUDE "engine/events/pick_up_item.asm"
INCLUDE "engine/overworld/movement.asm"
INCLUDE "engine/link/cable_club.asm"
INCLUDE "engine/menus/main_menu.asm"
INCLUDE "engine/movie/oak_speech/oak_speech.asm"
INCLUDE "engine/overworld/special_warps.asm"
INCLUDE "engine/debug/debug_party.asm"
INCLUDE "engine/menus/naming_screen.asm"
INCLUDE "engine/movie/oak_speech/oak_speech2.asm"
INCLUDE "engine/items/subtract_paid_money.asm"
INCLUDE "engine/menus/swap_items.asm"
INCLUDE "engine/events/pokemart.asm"
INCLUDE "engine/pokemon/learn_move.asm"
INCLUDE "engine/events/pokecenter.asm"
INCLUDE "engine/events/set_blackout_map.asm"
INCLUDE "engine/menus/display_text_id_init.asm"
INCLUDE "engine/menus/draw_start_menu.asm"
INCLUDE "engine/link/cable_club_npc.asm"
INCLUDE "engine/menus/text_box.asm"
INCLUDE "engine/battle/move_effects/drain_hp.asm"
INCLUDE "engine/menus/players_pc.asm"
INCLUDE "engine/pokemon/remove_mon.asm"
INCLUDE "engine/events/display_pokedex.asm"


SECTION "bank3", ROMX

INCLUDE "engine/joypad.asm"
INCLUDE "engine/overworld/clear_variables.asm"
INCLUDE "engine/overworld/player_state.asm"
INCLUDE "engine/events/poison.asm"
INCLUDE "engine/overworld/tilesets.asm"
INCLUDE "engine/overworld/daycare_exp.asm"
INCLUDE "data/maps/hide_show_data.asm"
INCLUDE "engine/overworld/wild_mons.asm"
INCLUDE "engine/items/item_effects.asm"
INCLUDE "engine/menus/draw_badges.asm"
INCLUDE "engine/overworld/update_map.asm"
INCLUDE "engine/overworld/cut.asm"
INCLUDE "engine/overworld/missable_objects.asm"
INCLUDE "engine/overworld/push_boulder.asm"
INCLUDE "engine/pokemon/add_mon.asm"
INCLUDE "engine/flag_action.asm"
INCLUDE "engine/events/heal_party.asm"
INCLUDE "engine/math/bcd.asm"
INCLUDE "engine/movie/oak_speech/init_player_data.asm"
INCLUDE "engine/items/get_bag_item_quantity.asm"
INCLUDE "engine/overworld/pathfinding.asm"
INCLUDE "engine/gfx/hp_bar.asm"
INCLUDE "engine/events/hidden_objects/bookshelves.asm"
INCLUDE "engine/events/hidden_objects/indigo_plateau_statues.asm"
INCLUDE "engine/events/hidden_objects/book_or_sculpture.asm"
INCLUDE "engine/events/hidden_objects/elevator.asm"
INCLUDE "engine/events/hidden_objects/town_map.asm"
INCLUDE "engine/events/hidden_objects/pokemon_stuff.asm"


SECTION "bank4", ROMX

INCLUDE "gfx/font.asm"
INCLUDE "engine/pokemon/status_screen.asm"
INCLUDE "engine/menus/party_menu.asm"
INCLUDE "gfx/player.asm"
INCLUDE "engine/menus/start_sub_menus.asm"
INCLUDE "engine/items/tms.asm"


SECTION "Battle Engine 1", ROMX

INCLUDE "engine/battle/end_of_battle.asm"
INCLUDE "engine/battle/wild_encounters.asm"
INCLUDE "engine/battle/move_effects/recoil.asm"
INCLUDE "engine/battle/move_effects/conversion.asm"
INCLUDE "engine/battle/move_effects/haze.asm"

RunSpeed::
	ld a, [wArchipelagoOptions]
	bit BIT_AUTO_RUN_OFF, a
	jr z, .AutoRun
	ldh a, [hJoyHeld]
	bit BIT_B_BUTTON, a
	ret z
	jr .noAutoRun
.AutoRun
	ldh a, [hJoyHeld]
	bit BIT_B_BUTTON, a
	ret nz
.noAutoRun
	call IsPlayerCharacterBeingControlledByGame
	ret nz
	call AdvancePlayerSprite
	ret


SECTION "bank5", ROMX

INCLUDE "engine/gfx/load_pokedex_tiles.asm"
INCLUDE "engine/overworld/map_sprites.asm"


SECTION "Battle Engine 2", ROMX

INCLUDE "engine/battle/move_effects/substitute.asm"
INCLUDE "engine/menus/pc.asm"


SECTION "Doors and Ledges", ROMX

INCLUDE "engine/overworld/auto_movement.asm"
INCLUDE "engine/overworld/doors.asm"
INCLUDE "engine/overworld/ledges.asm"


SECTION "bank7", ROMX

INCLUDE "engine/movie/oak_speech/clear_save.asm"
INCLUDE "engine/events/elevator.asm"


SECTION "Hidden Objects 1", ROMX

INCLUDE "engine/menus/oaks_pc.asm"
INCLUDE "engine/events/hidden_objects/new_bike.asm"
INCLUDE "engine/events/hidden_objects/oaks_lab_posters.asm"
INCLUDE "engine/events/hidden_objects/safari_game.asm"
INCLUDE "engine/events/hidden_objects/cinnabar_gym_quiz.asm"
INCLUDE "engine/events/hidden_objects/magazines.asm"
INCLUDE "engine/events/hidden_objects/bills_house_pc.asm"
INCLUDE "engine/events/hidden_objects/oaks_lab_email.asm"


SECTION "Bill's PC", ROMX

INCLUDE "engine/pokemon/bills_pc.asm"


SECTION "Battle Engine 3", ROMX

INCLUDE "engine/battle/print_type.asm"
INCLUDE "engine/battle/save_trainer_name.asm"


SECTION "Battle Engine 4", ROMX

INCLUDE "engine/gfx/screen_effects.asm"
INCLUDE "engine/battle/move_effects/leech_seed.asm"


SECTION "Battle Engine 5", ROMX

INCLUDE "engine/battle/display_effectiveness.asm"
INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/pikachu/respawn_overworld_pikachu.asm"
INCLUDE "engine/battle/scale_sprites.asm"
INCLUDE "engine/slots/game_corner_slots2.asm"


SECTION "Slot Machines", ROMX

INCLUDE "engine/movie/title_rb.asm"
INCLUDE "engine/slots/slot_machine.asm"
INCLUDE "engine/slots/game_corner_slots.asm"


SECTION "Battle Engine 6", ROMX

INCLUDE "data/moves/moves.asm"
INCLUDE "data/pokemon/base_stats.asm"
INCLUDE "data/pokemon/cries.asm"
INCLUDE "engine/battle/trainer_ai.asm"
INCLUDE "engine/battle/draw_hud_pokeball_gfx.asm"
INCLUDE "gfx/trade.asm"
INCLUDE "engine/pokemon/evos_moves.asm"


SECTION "Battle Core", ROMX

INCLUDE "engine/battle/core.asm"
INCLUDE "engine/battle/effects.asm"


SECTION "bank10", ROMX

INCLUDE "engine/menus/pokedex.asm"
INCLUDE "engine/overworld/emotion_bubbles.asm"
INCLUDE "engine/movie/trade.asm"
INCLUDE "engine/movie/intro.asm"
INCLUDE "engine/movie/trade2.asm"
INCLUDE "engine/menus/options.asm"


SECTION "Pokédex Rating", ROMX

INCLUDE "engine/events/pokedex_rating.asm"


SECTION "Dungeon Warps", ROMX

INCLUDE "engine/overworld/dungeon_warps.asm"


SECTION "Hidden Objects 2", ROMX

INCLUDE "engine/events/card_key.asm"
INCLUDE "engine/events/prize_menu.asm"
INCLUDE "engine/events/hidden_objects/school_notebooks.asm"
INCLUDE "engine/events/hidden_objects/fighting_dojo.asm"
INCLUDE "engine/events/hidden_objects/indigo_plateau_hq.asm"


SECTION "Battle Engine 7", ROMX

INCLUDE "engine/battle/experience.asm"


SECTION "Diploma", ROMX

INCLUDE "engine/events/diploma.asm"


SECTION "Trainer Sight", ROMX

INCLUDE "engine/overworld/trainer_sight.asm"


SECTION "bank16", ROMX

INCLUDE "engine/pokemon/experience.asm"
INCLUDE "engine/pokemon/status_ailments.asm"
INCLUDE "engine/events/oaks_aide.asm"


SECTION "Saffron Guards", ROMX

INCLUDE "engine/events/saffron_guards.asm"


SECTION "Starter Dex", ROMX

INCLUDE "engine/events/starter_dex.asm"


SECTION "Hidden Objects 3", ROMX

INCLUDE "engine/movie/evolution.asm"
INCLUDE "engine/pokemon/set_types.asm"
INCLUDE "engine/events/hidden_objects/reds_room.asm"
INCLUDE "engine/events/hidden_objects/route_15_binoculars.asm"
INCLUDE "engine/events/hidden_objects/museum_fossils.asm"
INCLUDE "engine/events/hidden_objects/fanclub_pictures.asm"
INCLUDE "engine/events/hidden_objects/museum_fossils2.asm"
INCLUDE "engine/events/hidden_objects/school_blackboard.asm"
INCLUDE "engine/events/hidden_objects/vermilion_gym_trash.asm"


SECTION "Cinnabar Lab Fossils", ROMX

INCLUDE "engine/events/cinnabar_lab.asm"


SECTION "Hidden Objects 4", ROMX

INCLUDE "engine/events/hidden_objects/gym_statues.asm"
INCLUDE "engine/events/hidden_objects/bench_guys.asm"
INCLUDE "engine/events/hidden_objects/blues_room.asm"
INCLUDE "engine/events/hidden_objects/pokecenter_pc.asm"


SECTION "Version Graphics", ROMX

INCLUDE "gfx/version.asm"


SECTION "bank1C", ROMX

INCLUDE "engine/movie/splash.asm"
INCLUDE "engine/movie/hall_of_fame.asm"
INCLUDE "engine/overworld/healing_machine.asm"
INCLUDE "engine/overworld/player_animations.asm"
INCLUDE "engine/battle/ghost_marowak_anim.asm"
INCLUDE "engine/battle/battle_transitions.asm"
INCLUDE "engine/items/town_map.asm"
INCLUDE "engine/gfx/mon_icons.asm"
INCLUDE "engine/events/in_game_trades.asm"
INCLUDE "engine/gfx/palettes.asm"
INCLUDE "engine/menus/save.asm"


SECTION "Itemfinder 1", ROMX

INCLUDE "engine/items/itemfinder.asm"


SECTION "Vending Machine", ROMX

INCLUDE "engine/events/vending_machine.asm"


SECTION "Itemfinder 2", ROMX

INCLUDE "engine/menus/league_pc.asm"
INCLUDE "engine/overworld/elevator.asm"
INCLUDE "engine/events/hidden_items.asm"


SECTION "bank1E", ROMX

INCLUDE "engine/battle/animations.asm"
INCLUDE "engine/overworld/cut2.asm"
INCLUDE "engine/overworld/dust_smoke.asm"
INCLUDE "gfx/fishing.asm"
INCLUDE "data/moves/animations.asm"
INCLUDE "data/battle_anims/subanimations.asm"
INCLUDE "data/battle_anims/frame_blocks.asm"


SECTION "BG Map Attributes (Debug)", ROMX

IF DEF(_DEBUG)
	INCLUDE "engine/gfx/bg_map_attributes.asm"
ENDC


SECTION "BG Map Attributes", ROMX

INCLUDE "data/cgb/bg_map_attributes.asm"
IF !DEF(_DEBUG)
	INCLUDE "engine/gfx/bg_map_attributes.asm"
ENDC


SECTION "bank30", ROMX

; This whole bank is garbage data.
IF !DEF(_DEBUG)
	INCBIN "garbage/bank30.bin"
ENDC


SECTION "bank3A", ROMX

INCLUDE "data/pokemon/names.asm"
INCLUDE "engine/overworld/is_player_just_outside_map.asm"
INCLUDE "engine/printer/serial.asm"
INCLUDE "engine/printer/printer.asm"
INCLUDE "engine/events/diploma2.asm"
INCLUDE "engine/printer/printer2.asm"
INCLUDE "engine/overworld/npc_movement_2.asm"


SECTION "Pikachu PCM", ROMX

INCLUDE "engine/pikachu/pikachu_pcm.asm"
INCLUDE "engine/overworld/advance_player_sprite.asm"
INCLUDE "engine/events/black_out.asm"
INCLUDE "engine/overworld/specific_script_flags.asm"


SECTION "Try Pikachu Movement", ROMX

INCLUDE "engine/overworld/unused_load_missable_object_data.asm"
INCLUDE "engine/events/try_pikachu_movement.asm"


SECTION "Credits", ROMX

INCLUDE "engine/events/pokecenter_chansey.asm"
INCLUDE "engine/movie/credits.asm"


SECTION "Hidden Objects Core", ROMX

INCLUDE "engine/overworld/hidden_objects.asm"
INCLUDE "engine/events/hidden_objects/vermilion_gym_trash2.asm"


SECTION "Archipelago Core", ROMX

checkDeathLink_::
	ld a, [wArchipelagoDeathLink]
	cp 1
	ret nz
	CheckEvent EVENT_IN_SAFARI_ZONE
	jr z, .noSafari
	xor a
	ld [wSafariSteps], a
	ld [wSafariSteps + 1], a
	ld [wArchipelagoDeathLink], a
	ret
.noSafari
	xor a
	ld [wPartyMon1HP], a
	ld [wPartyMon2HP], a
	ld [wPartyMon3HP], a
	ld [wPartyMon4HP], a
	ld [wPartyMon5HP], a
	ld [wPartyMon6HP], a
	ld [wPartyMon1HP + 1], a
	ld [wPartyMon2HP + 1], a
	ld [wPartyMon3HP + 1], a
	ld [wPartyMon4HP + 1], a
	ld [wPartyMon5HP + 1], a
	ld [wPartyMon6HP + 1], a
	ld [wBattleMonHP], a
	ld [wBattleMonHP + 1], a
	ret

receiveArchipelagoItem_::
	ld a, [wArchipelagoItemReceived]
	and a
	ret z
	ld b, a
	ld c, 1
	call GiveItem
	ret nc
	ld a, [wArchipelagoItemsReceivedCount]
	ld c, a
	ld a, [wArchipelagoItemsReceivedCount + 1]
	ld b, a
	inc bc
	ld a, c
	ld [wArchipelagoItemsReceivedCount], a
	ld a, b
	ld [wArchipelagoItemsReceivedCount + 1], a
	xor a
	ld [wArchipelagoItemReceived], a

	ld a, [wArchipelagoOptions]
	bit BIT_AP_ITEM_TEXT_OFF, a
	jr nz, .playSoundOnly

	ld a, [wIsInBattle]
	and a
	jr z, .notInBattle

	ld hl, DisplayArchipelagoItem
	call PrintText
	farcall PrintEmptyString
	ld a, BATTLE_MENU_TEMPLATE
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call PlaceMenuCursor
	ret
.notInBattle
	ld a, TEXT_RECEIVED_ITEM
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID
.playSoundOnly
	ld a, SFX_GET_ITEM_1
	call PlaySound
	ret

FillStartInventory::
	ld hl, StartInventoryTable + 254
	ld b, 255
.loop
	ld a, [hld]
	dec b
	ret z
	and a
	jr z, .loop
	ld c, a
	push hl
	push bc
	call GiveItem
	pop bc
	pop hl
	jr .loop

StartInventoryTable:
.Archipelago_Start_Inventory_0
	ds 256, $00

ParalyzeTrap::
	ld a, (1 << PAR)
	call ApplyTrap
	ld a, [wIsInBattle]
	and a
	ret z
	farcall QuarterSpeedDueToParalysis
	ret

IceTrap::
	ld a, (1 << FRZ)
	jr ApplyTrap

FireTrap::
	ld a, (1 << BRN)
	call ApplyTrap
	ld a, [wIsInBattle]
	and a
	ret z
	farcall HalveAttackDueToBurn
	ret

PoisonTrap::
	ld a, (1 << PSN)
	jr ApplyTrap

SleepTrap::
	call Random
	and $7
	jr z, SleepTrap
	jr ApplyTrap

MACRO applytrap
	ld a, [\1HP]
	and a
	jr nz, .\1apply
	ld a, [\1HP + 1]
	and a
	jr z, .\1skip
.\1apply
	ld a, b
	ld [\1Status], a
.\1skip
ENDM

ApplyTrap:
	ld b, a
	applytrap wBattleMon
	applytrap wPartyMon1
	applytrap wPartyMon2
	applytrap wPartyMon3
	applytrap wPartyMon4
	applytrap wPartyMon5
	applytrap wPartyMon6
	ret

TenCoins::
	ld a, $10
	ldh [hCoins + 1], a
	jr addCoins

TwentyCoins::
	ld a, $20
	ldh [hCoins + 1], a
	jr addCoins

HundredCoins::
	xor a
	ldh [hCoins + 1], a
	ld a, $01
	ldh [hCoins], a
	jr addCoins2

addCoins:
	xor a
	ldh [hCoins], a
addCoins2:
	xor a
	ldh [hUnusedCoinsByte], a
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	ret

_GiveItem::
	ld a, [wcf91]
	ld b, a
	cp AP_ITEM
	jp z, .apitem
	cp PROGRESSIVE_CARD_KEY
	jr nz, .noProgCardKey
	ld a, [wArchipelagoProgressiveKeys]
	inc a
	cp 11
	jr c, .noCap
	ld a, 10
.noCap
	ld [wArchipelagoProgressiveKeys], a
	add CARD_KEY_2F - 1
	ld b, a
	ld [wcf91], a
	ld [wd11e], a
	jp .continue
.noProgCardKey
	cp TOWN_MAP
	jr nz, .noTownMap
.Archipelago_Map_Fly_Location_1
	ld a, $00
	ld c, a
	ld b, FLAG_SET
	ld hl, wTownVisitedFlag
	predef FlagActionPredef
	jp .continue
.noTownMap
	cp TEN_COINS
	jr nz, .no10coins
	farcall TenCoins
	jp .apitem
.no10coins
	cp TWENTY_COINS
	jr nz, .no20coins
	farcall TwentyCoins
	jp .apitem
.no20coins
	cp HUNDRED_COINS
	jr nz, .no100coins
	farcall HundredCoins
	jp .apitem
.no100coins
	cp POKEDEX
	jr nz, .noPokedex
	SetEvent EVENT_GOT_POKEDEX
	jp .apitem
.noPokedex
	cp POISON_TRAP
	jr nz, .noPoisonTrap
	farcall PoisonTrap
	jp .apitem
.noPoisonTrap
	cp PARALYZE_TRAP
	jr nz, .noParalyzeTrap
	farcall ParalyzeTrap
	jp .apitem
.noParalyzeTrap
	cp FIRE_TRAP
	jr nz, .noFireTrap
	farcall FireTrap
	jp .apitem
.noFireTrap
	cp ICE_TRAP
	jr nz, .noIceTrap
	farcall IceTrap
	jp .apitem
.noIceTrap
	cp SLEEP_TRAP
	jr nz, .noSleepTrap
	farcall SleepTrap
	jp .apitem
.noSleepTrap
	ld a, BOULDERBADGE - 1
.badgeLoop
	cp EARTHBADGE
	jr z, .continue
	inc a
	cp b
	jr nz, .badgeLoop
	ld c, 1
	ld a, b
	sub BOULDERBADGE
	jr .shiftBadgeBit
.shiftBadgeBitLoop
	sla c
	dec a
.shiftBadgeBit
	and a
	jr nz, .shiftBadgeBitLoop
	ld a, [wObtainedBadges]
	or c
	ld [wObtainedBadges], a
	jr .apitem
.continue
	ld hl, wNumBagItems
	call AddItemToInventory
	ret nc
.apitem
	call GetItemName
	call CopyToStringBuffer
	scf
	ret

MACRO ResetBattle
.Archipelago_Reset_\4_1
	ld a, \1
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, FLAG_TEST
	ld hl, wPokedexOwned
	predef FlagActionPredef
	ld a, c
	and a
	jr nz, .noReset\4
	ResetEvent \2
	ld a, \3
	ld [wMissableObjectIndex], a
	predef ShowObject
.noReset\4
ENDM

ResetStaticPokemon::
	ResetBattle SNORLAX, EVENT_BEAT_ROUTE12_SNORLAX, HS_ROUTE_12_SNORLAX, A
	ResetBattle SNORLAX, EVENT_BEAT_ROUTE16_SNORLAX, HS_ROUTE_16_SNORLAX, B
	ResetBattle VOLTORB, EVENT_BEAT_POWER_PLANT_VOLTORB_0, HS_VOLTORB_1, C
	ResetBattle VOLTORB, EVENT_BEAT_POWER_PLANT_VOLTORB_1, HS_VOLTORB_2, D
	ResetBattle VOLTORB, EVENT_BEAT_POWER_PLANT_VOLTORB_2, HS_VOLTORB_3, E
	ResetBattle ELECTRODE, EVENT_BEAT_POWER_PLANT_VOLTORB_3, HS_ELECTRODE_1, F
	ResetBattle VOLTORB, EVENT_BEAT_POWER_PLANT_VOLTORB_4, HS_VOLTORB_4, G
	ResetBattle VOLTORB, EVENT_BEAT_POWER_PLANT_VOLTORB_5, HS_VOLTORB_5, H
	ResetBattle ELECTRODE, EVENT_BEAT_POWER_PLANT_VOLTORB_6, HS_ELECTRODE_2, I
	ResetBattle VOLTORB, EVENT_BEAT_POWER_PLANT_VOLTORB_7, HS_VOLTORB_6, J
	ResetBattle ZAPDOS, EVENT_BEAT_ZAPDOS, HS_ZAPDOS, K
	ResetBattle ARTICUNO, EVENT_BEAT_ARTICUNO, HS_ARTICUNO, L
	ResetBattle MOLTRES, EVENT_BEAT_MOLTRES, HS_MOLTRES, M
	ResetBattle MEWTWO, EVENT_BEAT_MEWTWO, HS_MEWTWO, N
	ResetBattle MEW, EVENT_BEAT_MEW, HS_MEW, O
	ret


SECTION "Battle Engine 8", ROMX

INCLUDE "engine/battle/common_text.asm"
INCLUDE "engine/battle/link_battle_versus_text.asm"
INCLUDE "engine/battle/unused_stats_functions.asm"
INCLUDE "engine/battle/scroll_draw_trainer_pic.asm"
INCLUDE "engine/battle/pikachu_entrance_anim.asm"
INCLUDE "engine/battle/decrement_pp.asm"
INCLUDE "engine/events/pikachu_happiness.asm"


SECTION "Battle Engine 9", ROMX

INCLUDE "engine/movie/title_yellow.asm"
INCLUDE "engine/menus/link_menu.asm"
INCLUDE "engine/menus/unused_input.asm"
INCLUDE "engine/overworld/field_move_messages.asm"
INCLUDE "engine/items/inventory.asm"
INCLUDE "gfx/trainer_card.asm"
INCLUDE "engine/items/super_rod.asm"
INCLUDE "engine/battle/init_battle.asm"
INCLUDE "engine/battle/init_battle_variables.asm"
INCLUDE "engine/battle/move_effects/focus_energy.asm"
INCLUDE "engine/battle/move_effects/heal.asm"
INCLUDE "engine/battle/move_effects/transform.asm"
INCLUDE "engine/battle/move_effects/reflect_light_screen.asm"
INCLUDE "engine/battle/move_effects/mist.asm"
INCLUDE "engine/battle/move_effects/one_hit_ko.asm"
INCLUDE "engine/battle/move_effects/pay_day.asm"
INCLUDE "engine/battle/move_effects/paralyze.asm"
INCLUDE "engine/items/tm_prices.asm"
INCLUDE "engine/math/multiply_divide.asm"
INCLUDE "engine/events/give_pokemon.asm"
INCLUDE "engine/battle/get_trainer_name.asm"
INCLUDE "engine/math/random.asm"
INCLUDE "engine/predefs.asm"


SECTION "Surfing Minigame", ROMX

INCLUDE "engine/minigame/surfing_pikachu.asm"
INCLUDE "engine/movie/intro_yellow.asm"
INCLUDE "engine/gfx/animated_objects.asm"


SECTION "Overworld Pikachu", ROMX

INCLUDE "data/maps/songs.asm"
INCLUDE "data/maps/map_header_pointers.asm"
INCLUDE "data/maps/map_header_banks.asm"
INCLUDE "engine/pikachu/pikachu_follow.asm"
INCLUDE "engine/pikachu/pikachu_status.asm"
INCLUDE "engine/pikachu/pikachu_emotions.asm"
INCLUDE "engine/pikachu/pikachu_movement.asm"
INCLUDE "engine/pikachu/pikachu_pic_animation.asm"
INCLUDE "engine/debug/debug_menu.asm"
