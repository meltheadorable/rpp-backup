; INPUTS - Mon DVs in de, species in wGenderTemp
; OUTPUT - Mon's gender in wGenderTemp
GetMonGender::
	ld hl, MonGenderRatios
	ld a, [wGenderTemp]
	dec a
	ld c, a
	ld b, 0
	add hl, bc ; hl now points to the species gender ratio

; Attack DV
	ld a, [de]
	and $f0
	ld b, a
; Speed DV
	inc de
	ld a, [de]
	and $f0
	swap a
; Put them together
	or b
	ld b, a ; b now has the combined DVs

; Get the gender ratio
	ld a, [hl]

; Check for always one or another
	cp NO_GENDER
	jr z, .genderless

	cp FEMALE_ONLY
	jr z, .female

	and a ; MALE_ONLY
	jr z, .male

; Compare the ratio to the value we found earlier
	cp b
	jr c, .male

.female
	ld a, FEMALE
	jr .done
.male
	ld a, MALE
	jr .done
.genderless
	ld a, GENDERLESS
.done
	ld [wGenderTemp], a
	ret

MonGenderRatios:
	db FEMALE_ONLY   ; Bulbasaur
	db FEMALE_ONLY   ; Ivysaur
	db FEMALE_ONLY   ; Venusaur
	db FEMALE_ONLY   ; Charmander
	db FEMALE_ONLY   ; Charmeleon
	db FEMALE_ONLY   ; Charizard
	db FEMALE_ONLY   ; Squirtle
	db FEMALE_ONLY   ; Wartortle
	db FEMALE_ONLY   ; Blastoise
	db FEMALE_ONLY ; Caterpie
	db FEMALE_ONLY ; Metapod
	db FEMALE_ONLY ; Butterfree
	db FEMALE_ONLY ; Weedle
	db FEMALE_ONLY ; Kakuna
	db FEMALE_ONLY ; Beedrill
	db FEMALE_ONLY ; Pidgey
	db FEMALE_ONLY ; Pidgeotto
	db FEMALE_ONLY ; Pidgeot
	db FEMALE_ONLY ; Rattata
	db FEMALE_ONLY ; Raticate
	db FEMALE_ONLY ; Spearow
	db FEMALE_ONLY ; Fearow
	db FEMALE_ONLY ; Ekans
	db FEMALE_ONLY ; Arbok
	db FEMALE_ONLY ; Pikachu
	db FEMALE_ONLY ; Raichu
	db FEMALE_ONLY ; Sandshrew
	db FEMALE_ONLY ; Sandslash
	db FEMALE_ONLY       ; Nidoran F
	db FEMALE_ONLY       ; Nidorina
	db FEMALE_ONLY       ; Nidoqueen
	db MALE_ONLY         ; Nidoran M
	db MALE_ONLY         ; Nidorino
	db MALE_ONLY         ; Nidoking
	db FEMALE_ONLY ; Clefairy
	db FEMALE_ONLY ; Clefable
	db FEMALE_ONLY ; Vulpix
	db FEMALE_ONLY ; Ninetales
	db FEMALE_ONLY ; Jigglypuff
	db FEMALE_ONLY ; WIgglytuff
	db FEMALE_ONLY ; Zubat
	db FEMALE_ONLY ; Golbat
	db FEMALE_ONLY ; Oddish
	db FEMALE_ONLY ; Gloom
	db FEMALE_ONLY ; Vileplume
	db FEMALE_ONLY ; Paras
	db FEMALE_ONLY ; Parasect
	db FEMALE_ONLY ; Venonat
	db FEMALE_ONLY ; Venomoth
	db FEMALE_ONLY ; Diglett
	db FEMALE_ONLY ; Dugtrio
	db FEMALE_ONLY ; Meowth
	db FEMALE_ONLY ; Persian
	db FEMALE_ONLY ; Psyduck
	db FEMALE_ONLY ; Golduck
	db FEMALE_ONLY ; Mankey
	db FEMALE_ONLY ; Primeape
	db FEMALE_ONLY   ; Growlithe
	db FEMALE_ONLY   ; Arcanine
	db FEMALE_ONLY ; Poliwag
	db FEMALE_ONLY ; Poliwhirl
	db FEMALE_ONLY ; Poliwrath
	db FEMALE_ONLY   ; Abra
	db FEMALE_ONLY   ; Kadabra
	db FEMALE_ONLY   ; Alakazam
	db FEMALE_ONLY   ; Machop
	db FEMALE_ONLY   ; Machoke
	db FEMALE_ONLY   ; Machamp
	db FEMALE_ONLY ; Bellsprout
	db FEMALE_ONLY ; Weepinbell
	db FEMALE_ONLY ; Victreebel
	db FEMALE_ONLY ; Tentacool
	db FEMALE_ONLY ; Tentacruel
	db FEMALE_ONLY ; Geodude
	db FEMALE_ONLY ; Graveler
	db FEMALE_ONLY ; Golem
	db FEMALE_ONLY ; Ponyta
	db FEMALE_ONLY ; Rapidash
	db FEMALE_ONLY ; Slowpoke
	db FEMALE_ONLY ; Slowbro
	db NO_GENDER         ; Magnemite
	db NO_GENDER         ; Magneton
	db FEMALE_ONLY ; Farfetch'd
	db FEMALE_ONLY ; Doduo
	db FEMALE_ONLY ; Dodrio
	db FEMALE_ONLY ; Seel
	db FEMALE_ONLY ; Dewgong
	db FEMALE_ONLY ; Grimer
	db FEMALE_ONLY ; Muk
	db FEMALE_ONLY ; Shellder
	db FEMALE_ONLY ; Cloyster
	db FEMALE_ONLY ; Gastly
	db FEMALE_ONLY ; Haunter
	db FEMALE_ONLY ; Gengar
	db FEMALE_ONLY ; Onix
	db FEMALE_ONLY ; Drowzee
	db FEMALE_ONLY ; Hypno
	db FEMALE_ONLY ; Krabby
	db FEMALE_ONLY ; Kingler
	db NO_GENDER         ; Voltorb
	db NO_GENDER         ; Electrode
	db FEMALE_ONLY ; Exeggcute
	db FEMALE_ONLY ; Exeggutor
	db FEMALE_ONLY ; Cubone
	db FEMALE_ONLY ; Marowak
	db FEMALE_ONLY         ; Hitmonlee
	db FEMALE_ONLY         ; Hitmonchan
	db FEMALE_ONLY ; Lickitung
	db FEMALE_ONLY ; Koffing
	db FEMALE_ONLY ; Weezing
	db FEMALE_ONLY ; Rhyhorn
	db FEMALE_ONLY ; Rhydon
	db FEMALE_ONLY       ; Chansey
	db FEMALE_ONLY ; Tangela
	db FEMALE_ONLY       ; Kangaskhan
	db FEMALE_ONLY ; Horsea
	db FEMALE_ONLY ; Seadra
	db FEMALE_ONLY ; Goldeen
	db FEMALE_ONLY ; Seaking
	db NO_GENDER         ; Staryu
	db NO_GENDER         ; Starmie
	db FEMALE_ONLY ; Mr. Mime
	db FEMALE_ONLY ; Scyther
	db FEMALE_ONLY       ; Jynx
	db FEMALE_ONLY   ; Electabuzz
	db FEMALE_ONLY   ; Magmar
	db FEMALE_ONLY ; Pinsir
	db MALE_ONLY         ; Tauros
	db FEMALE_ONLY ; Magikarp
	db FEMALE_ONLY ; Gyarados
	db FEMALE_ONLY ; Lapras
	db NO_GENDER         ; Ditto
	db FEMALE_ONLY   ; Eevee
	db FEMALE_ONLY   ; Vaporeon
	db FEMALE_ONLY   ; Jolteon
	db FEMALE_ONLY   ; Flareon
	db NO_GENDER         ; Porygon
	db FEMALE_ONLY   ; Omanyte
	db FEMALE_ONLY   ; Omastar
	db FEMALE_ONLY   ; Kabuto
	db FEMALE_ONLY   ; Kabutops
	db FEMALE_ONLY   ; Aerodactyl
	db FEMALE_ONLY   ; Snorlax
	db NO_GENDER         ; Articuno
	db NO_GENDER         ; Zapdos
	db NO_GENDER         ; Moltres
	db FEMALE_ONLY ; Dratini
	db FEMALE_ONLY ; Dragonair
	db FEMALE_ONLY ; Dragonite
	db NO_GENDER         ; Mewtwo
	db NO_GENDER         ; Mew
	db NO_GENDER         ; Lugia
	db FEMALE_ONLY ; Houndour
	db FEMALE_ONLY ; Houndoom
	db FEMALE_ONLY ; Murkrow
	db FEMALE_ONLY ; Honchkrow
	db FEMALE_ONLY ; Heracross
	db FEMALE_ONLY   ; Espeon
	db FEMALE_ONLY   ; Umbreon
	db FEMALE_ONLY   ; Glaceon
	db FEMALE_ONLY   ; Leafeon
	db FEMALE_ONLY   ; Sylveon
	db FEMALE_ONLY ; Scizor
	db FEMALE_ONLY ; Steelix
	db FEMALE_ONLY ; Crobat
	db FEMALE_ONLY ; Poitoed
	db FEMALE_ONLY ; Slowking
	db FEMALE_ONLY ; Bellossom
	db FEMALE_ONLY ; Kingdra
	db FEMALE_ONLY       ; Blissey
	db NO_GENDER         ; Porygon 2
	db NO_GENDER         ; Porygon Z
	db FEMALE_ONLY   ; Magmortar
	db FEMALE_ONLY   ; Electivire
	db NO_GENDER         ; Magnezone
	db FEMALE_ONLY ; Rhyperior
	db FEMALE_ONLY ; Tangrowth
	db FEMALE_ONLY ; Lickilicky
	db FEMALE_ONLY   ; Togepi
	db FEMALE_ONLY   ; Togetic
	db FEMALE_ONLY   ; Togekiss
	db FEMALE_ONLY ; Sneasel
	db FEMALE_ONLY ; Weavile
	db FEMALE_ONLY ; Skarmory
	db FEMALE_ONLY ; Misdreavus
	db FEMALE_ONLY ; Mismagius
	db FEMALE_ONLY       ; Miltank
	db FEMALE_ONLY ; Chinchou
	db FEMALE_ONLY ; Lanturn
	db FEMALE_ONLY ; Slugma
	db FEMALE_ONLY ; Magcargo
	db FEMALE_ONLY ; Torkoal
	db NO_GENDER         ; Latios
	db NO_GENDER         ; Latias
	db FEMALE_ONLY         ; Hitmontop
	db FEMALE_ONLY         ; Tyrogue
	db FEMALE_ONLY ; Pichu
	db FEMALE_ONLY ; Cleffa
	db FEMALE_ONLY ; Igglybuff
	db FEMALE_ONLY       ; Smoochum
	db FEMALE_ONLY   ; Elekid
	db FEMALE_ONLY   ; Magby
	db FEMALE_ONLY ; Mime Jr
	db FEMALE_ONLY       ; Happiny
	db FEMALE_ONLY   ; Munchlax
	db FEMALE_ONLY ; Zigzagoon
	db FEMALE_ONLY ; Linoone
	db NO_GENDER         ; Ho-oh
