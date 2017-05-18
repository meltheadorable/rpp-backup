FightingDojoObject: ; 0x5cf9b (size=72)
	db $3 ; border block

	db $2 ; warps
	db $b, $4, $1, $ff
	db $b, $5, $1, $ff

	db $0 ; signs

	db $7 ; objects
	object SPRITE_BLACKBELT, $5, $3, FACE, DOWN, $1, BLACKBELT + $C8, $1
	object SPRITE_BLACKBELT, $3, $4, FACE, LEFT, $2, BLACKBELT + $C8, $2
	object SPRITE_BLACKBELT, $3, $6, FACE, LEFT, $3, BLACKBELT + $C8, $3
	object SPRITE_BLACKBELT, $5, $5, FACE, RIGHT, $4, BLACKBELT + $C8, $4
	object SPRITE_BLACKBELT, $5, $7, FACE, RIGHT, $5, BLACKBELT + $C8, $5
	object SPRITE_BALL, $4, $1, FACE, STAY, $6 ; person
	object SPRITE_BALL, $5, $1, FACE, STAY, $7 ; person

	; warp-to
	EVENT_DISP FIGHTING_DOJO_WIDTH, $b, $4
	EVENT_DISP FIGHTING_DOJO_WIDTH, $b, $5
