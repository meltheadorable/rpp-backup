RockTunnelPokecenterObject: ; 0x493d4 (size=44)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $0, $ff
	db $7, $4, $0, $ff

	db $0 ; signs

	db $4 ; objects
	object SPRITE_NURSE, $3, $1, FACE, DOWN, $1 ; person
	object SPRITE_GENTLEMAN, $7, $3, WALK, $2, $2 ; person
	object SPRITE_FISHER2, $2, $5, FACE, STAY, $3 ; person
	object SPRITE_CABLE_CLUB_WOMAN, $b, $2, FACE, DOWN, $4 ; person

	; warp-to
	EVENT_DISP ROCK_TUNNEL_POKECENTER_WIDTH, $7, $3
	EVENT_DISP ROCK_TUNNEL_POKECENTER_WIDTH, $7, $4
