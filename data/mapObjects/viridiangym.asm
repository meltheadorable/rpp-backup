ViridianGymObject: ; 0x74bde (size=105)
	db $3 ; border block

	db $2 ; warps
	db $11, $10, $4, $ff
	db $11, $11, $4, $ff

	db $0 ; signs

	db $b ; objects
	object SPRITE_GIOVANNI, $2, $1, FACE, DOWN, $1, BLAINE + $C8, $2 ; temp fix
	object SPRITE_BLACK_HAIR_BOY_1, $c, $7, FACE, DOWN, $2, COOLTRAINER_M + $C8, $9
	object SPRITE_BLACKBELT, $b, $b, FACE, UP, $3, BLACKBELT + $C8, $6
	object SPRITE_ROCKER, $a, $7, FACE, DOWN, $4, TAMER + $C8, $3
	object SPRITE_BLACKBELT, $3, $7, FACE, RIGHT, $5, BLACKBELT + $C8, $7
	object SPRITE_BLACK_HAIR_BOY_1, $d, $5, FACE, LEFT, $6, COOLTRAINER_M + $C8, $a
	object SPRITE_BLACKBELT, $a, $1, FACE, DOWN, $7, BLACKBELT + $C8, $8
	object SPRITE_ROCKER, $2, $10, FACE, LEFT, $8, TAMER + $C8, $4
	object SPRITE_BLACK_HAIR_BOY_1, $6, $5, FACE, DOWN, $9, COOLTRAINER_M + $C8, $1
	object SPRITE_GYM_HELPER, $10, $f, FACE, DOWN, $a ; person
	object SPRITE_BALL, $10, $9, FACE, STAY, $b, REVIVE

	; warp-to
	EVENT_DISP VIRIDIAN_GYM_WIDTH, $11, $10
	EVENT_DISP VIRIDIAN_GYM_WIDTH, $11, $11
