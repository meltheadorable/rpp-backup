ViridianForestExitObject: ; 0x5d598 (size=48)
	db $a ; border block

	db $4 ; warps
	db $0, $4, $1, $ff
	db $0, $5, $1, $ff
	db $7, $4, $0, VIRIDIAN_FOREST
	db $7, $5, $0, VIRIDIAN_FOREST

	db $0 ; signs

	db $2 ; objects
	object SPRITE_LASS, $3, $2, FACE, STAY, $1 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $2, $5, FACE, STAY, $2 ; person

	; warp-to
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $0, $4
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $0, $5
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $7, $4 ; VIRIDIAN_FOREST
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $7, $5 ; VIRIDIAN_FOREST
