Mansion2Object: ; 0x520d1 (size=63)
	db $1 ; border block

	db $4 ; warps
	db $a, $5, $4, MANSION_1
	db $a, $7, $0, MANSION_3
	db $e, $19, $2, MANSION_3
	db $1, $6, $1, MANSION_3

	db $0 ; signs

	db $4 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $3, $11, WALK, $2, $1, BURGLAR + $C8, $7
	object SPRITE_BALL, $1c, $b, FACE, STAY, $2, OLD_SEA_MAP
	object SPRITE_BOOK, $12, $2, FACE, STAY, $3 ; person
	object SPRITE_BOOK, $3, $16, FACE, STAY, $4 ; person

	; warp-to
	EVENT_DISP MANSION_2_WIDTH, $a, $5 ; MANSION_1
	EVENT_DISP MANSION_2_WIDTH, $a, $7 ; MANSION_3
	EVENT_DISP MANSION_2_WIDTH, $e, $19 ; MANSION_3
	EVENT_DISP MANSION_2_WIDTH, $1, $6 ; MANSION_3
