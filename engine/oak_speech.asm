SetDefaultNames: ; 60ca (1:60ca)
	ld a, [wLetterPrintingDelayFlags]
	push af
	ld a, [wOptions]
	push af
	ld a, [wd732]
	push af
	ld hl, wPlayerName
	ld bc, $d8a
	xor a
	call FillMemory
	ld hl, wSpriteStateData1
	ld bc, $200
	xor a
	call FillMemory
	pop af
	ld [wd732], a
	pop af
	ld [wOptions], a
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld a, [wOptionsInitialized]
	and a
	call z, InitOptions
	ld hl, NintenText
	ld de, wCurTrainerName
	ld bc, $b
	call CopyData
	ld hl, NintenText
	ld de, wPlayerName
	ld bc, $b
	call CopyData
	ld hl, SonyText
	ld de, wRivalName
	ld bc, $b
	jp CopyData

OakSpeech: ; 6115 (1:6115)
	ld a,$FF
	call PlaySound ; stop music
	ld a, BANK(Music_Routes2)
	ld c,a
	ld a, MUSIC_ROUTES2
	call PlayMusic
	call ClearScreen
	call LoadTextBoxTilePatterns
	call SetDefaultNames
	predef InitPlayerData2
	ld hl,wNumBoxItems
	ld a,POTION
	ld [wcf91],a
	ld a,1
	ld [wItemQuantity],a
	call AddItemToInventory  ; give one potion
	ld a,[W_ANIMATIONID]
	ld [wDestinationMap],a
	call SpecialWarpIn
	xor a
	ld [hTilesetType],a
	ld a,[wd732]
	bit 1,a ; possibly a debug mode bit
	jp nz,.skipChoosingNames
	
	callba DisplayHackVersionScreen
	
	callba ShowPlayerLargePics
	
	ld hl,BoyGirlText  ; added to the same file as the other oak text
	call PrintText     ; show this text
	call BoyGirlChoice ; added routine at the end of this file
	ld a, [wCurrentMenuItem]
	ld [wPlayerGender], a ; store player's gender. 00 for boy, 01 for girl
	
	call ClearScreen ; to erase the large player images after choosing gender
	
	ld hl,ShouldMonsObeyText
	call PrintText
	call YesNoChoice
	ld a,[wCurrentMenuItem]
	and a
	jr nz, .canDisobey
	ld hl,wExtraFlags
	set 2,[hl]
.canDisobey
	call ClearScreen ; clear the screen before resuming normal intro
	ld de,ProfOakPic
	ld bc, (Bank(ProfOakPic) << 8) | $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl,OakSpeechText1
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen
	ld a,SYLVEON
	ld [wd0b5],a
	ld [wcf91],a
	call GetMonHeader
	coord hl, 6, 4
	call LoadFlippedFrontSpriteByMonIndex
	call MovePicLeft
	ld hl,OakSpeechText2
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen
	ld de,RedPicFront
	ld bc,(Bank(RedPicFront) << 8) | $00
	ld a, [wPlayerGender] ; check gender
	and a      ; check gender
	jr z, .NotLeaf1
	ld de,LeafPicFront
	ld bc,(Bank(LeafPicFront) << 8) | $00
.NotLeaf1:
	call IntroDisplayPicCenteredOrUpperRight
	call MovePicLeft
	ld hl,IntroducePlayerText
	call PrintText
	call ChoosePlayerName
	call GBFadeOutToWhite
	call ClearScreen
	ld de,Rival1Pic
	ld bc,(Bank(Rival1Pic) << 8) | $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl,IntroduceRivalText
	call PrintText
	call ChooseRivalName
.skipChoosingNames
	call GBFadeOutToWhite
	call ClearScreen
	ld de,RedPicFront
	ld bc,(Bank(RedPicFront) << 8) | $00
	ld a, [wPlayerGender] ; check gender
	and a      ; check gender
	jr z, .NotLeaf2
	ld de,LeafPicFront
	ld bc,(Bank(LeafPicFront) << 8) | $00
.NotLeaf2:
	call IntroDisplayPicCenteredOrUpperRight
	call GBFadeInFromWhite
	ld a,[wd72d]
	and a
	jr nz,.next
	ld hl,OakSpeechText3
	call PrintText
.next
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,SFX_SHRINK
	call PlaySound
	pop af
	ld [H_LOADEDROMBANK],a
	ld [MBC1RomBank],a
	ld c,4
	call DelayFrames
	ld de,RedSprite
	ld bc,(BANK(RedSprite) << 8) | $0C
	ld a, [wPlayerGender] ; check gender
	and a      ; check gender
	jr z, .NotLeaf3
	ld de,LeafSprite
	ld bc,(BANK(LeafSprite) << 8) | $0C
.NotLeaf3:
	ld hl,vSprites
	call CopyVideoData
	ld de,ShrinkPic1
	ld bc,(BANK(ShrinkPic1) << 8) | $00
	call IntroDisplayPicCenteredOrUpperRight
	ld c,4
	call DelayFrames
	ld de,ShrinkPic2
	ld bc,(BANK(ShrinkPic2) << 8) | $00
	call IntroDisplayPicCenteredOrUpperRight
	call ResetPlayerSpriteData
	ld a,[H_LOADEDROMBANK]
	push af
	ld a, BANK(Music_PalletTown)
	ld [wc0ef],a
	ld [wc0f0],a
	ld a,$A
	ld [wMusicHeaderPointer],a
	ld a,$FF
	ld [wc0ee],a
	call PlaySound ; stop music
	pop af
	ld [H_LOADEDROMBANK],a
	ld [MBC1RomBank],a
	ld c,20
	call DelayFrames
	coord hl, 6, 5
	ld b,7
	ld c,7
	call ClearScreenArea
	call LoadTextBoxTilePatterns
	ld a,1
	ld [wUpdateSpritesEnabled],a
	ld c,50
	call DelayFrames
	call GBFadeOutToWhite
	jp ClearScreen
OakSpeechText1: ; 6253 (1:6253)
	TX_FAR _OakSpeechText1
	db "@"
OakSpeechText2: ; 6258 (1:6258)
	TX_FAR _OakSpeechText2A
	db $14 ; play NIDORINA cry from TextCommandSounds
	TX_FAR _OakSpeechText2B
	db "@"
IntroducePlayerText: ; 6262 (1:6262)
	TX_FAR _IntroducePlayerText
	db "@"
IntroduceRivalText: ; 6267 (1:6267)
	TX_FAR _IntroduceRivalText
	db "@"
OakSpeechText3: ; 626c (1:626c)
	TX_FAR _OakSpeechText3
	db "@"
BoyGirlText: ; This is new so we had to add a reference to get it to compile
	TX_FAR _BoyGirlText
	db "@"
ShouldMonsObeyText: ; Added to ask if you wanted traded Pokemon to obey like normal ones
	TX_FAR _ShouldMonsObeyText
	db "@"

FadeInIntroPic: ; 6271 (1:6271)
	ld hl,IntroFadePalettes
	ld b,6
.next
	ld a,[hli]
	ld [rBGP],a
	ld c,10
	call DelayFrames
	dec b
	jr nz,.next
	ret

IntroFadePalettes: ; 6282 (1:6282)
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100

MovePicLeft: ; 6288 (1:6288)
	ld a,119
	ld [rWX],a
	call DelayFrame

	ld a,$E4
	ld [rBGP],a
.next
	call DelayFrame
	ld a,[rWX]
	sub 8
	cp $FF
	ret z
	ld [rWX],a
	jr .next

DisplayPicCenteredOrUpperRight: ; 62a1 (1:62a1)
	call GetPredefRegisters
IntroDisplayPicCenteredOrUpperRight: ; 62a4 (1:62a4)
; b = bank
; de = address of compressed pic
; c: 0 = centred, non-zero = upper-right
	push bc
	ld a,b
	call UncompressSpriteFromDE
	ld hl,S_SPRITEBUFFER1
	ld de,S_SPRITEBUFFER0
	ld bc,$310
	call CopyData
	ld de,vFrontPic
	call InterlaceMergeSpriteBuffers
	pop bc
	ld a,c
	and a
	coord hl, 15, 1
	jr nz,.next
	coord hl, 6, 4
.next
	xor a
	ld [hStartTileID],a
	predef_jump CopyUncompressedPicToTilemap

	
; displays boy/girl choice
; yes -> set carry flag
BoyGirlChoice::
	call SaveScreenTilesToBuffer1
	call InitBoyGirlTextBoxParameters
	jr DisplayBoyGirlChoice
	
InitBoyGirlTextBoxParameters::
	ld a, $1 ; loads the value for the unused North/West choice, that was changed to say Boy/Girl
	ld [wTwoOptionMenuID], a
	coord hl, 13, 7 
	ld bc, $80e
	ret
	
DisplayBoyGirlChoice::
	ld a, $14
	ld [wTextBoxID], a
	call DisplayTextBoxID
	jp LoadScreenTilesFromBuffer1
