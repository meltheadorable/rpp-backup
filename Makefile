ifneq ($(wildcard rgbds/.*),)
RGBDS_DIR = rgbds/
else
RGBDS_DIR =
endif

PYTHON := python2
MD5 := md5sum -c --quiet

2bpp     := $(PYTHON) extras/pokemontools/gfx.py 2bpp
1bpp     := $(PYTHON) extras/pokemontools/gfx.py 1bpp
pic      := $(PYTHON) extras/pokemontools/pic.py compress
includes := $(PYTHON) extras/pokemontools/scan_includes.py

pokered_obj := audio_red.o main_red.o text_red.o wram_red.o
pokeblue_obj := audio_blue.o main_blue.o text_blue.o wram_blue.o
pokered_ladies_obj := audio_red_ladies.o main_red_ladies.o text_red_ladies.o wram_red_ladies.o
pokeblue_ladies_obj := audio_blue_ladies.o main_blue_ladies.o text_blue_ladies.o wram_blue_ladies.o

.SUFFIXES:
.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp .pic
.SECONDEXPANSION:
# Suppress annoying intermediate file deletion messages.
.PRECIOUS: %.2bpp
.PHONY: all clean clean_less red blue red_ladies blue_ladies compare

roms := pokered.gbc pokeblue.gbc pokered_ladies.gbc pokeblue_ladies.gbc

all: $(roms)
red: pokered.gbc
blue: pokeblue.gbc
red_ladies: pokered_ladies.gbc
blue_ladies: pokeblue_ladies.gbc

# For contributors to make sure a change didn't affect the contents of the rom.
compare: red blue
	@$(MD5) roms.md5

clean:
	rm -f $(roms) $(pokered_obj) $(pokeblue_obj) $(pokered_ladies_obj) $(pokeblue_ladies_obj) $(roms:.gbc=.sym)
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' \) -exec rm {} +
	
clean_less:
	rm -f $(roms) $(pokered_obj) $(pokeblue_obj) $(pokered_ladies_obj) $(pokeblue_ladies_obj) $(roms:.gbc=.sym)

%.asm: ;

%_red.o: dep = $(shell $(includes) $(@D)/$*.asm)
$(pokered_obj): %_red.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm -D _RED -h -o $@ $*.asm

%_blue.o: dep = $(shell $(includes) $(@D)/$*.asm)
$(pokeblue_obj): %_blue.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm -D _BLUE -h -o $@ $*.asm
	
%_red_ladies.o: dep = $(shell $(includes) $(@D)/$*.asm)
$(pokered_ladies_obj): %_red_ladies.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm -D _RED -D _LADIES -h -o $@ $*.asm

%_blue_ladies.o: dep = $(shell $(includes) $(@D)/$*.asm)
$(pokeblue_ladies_obj): %_blue_ladies.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm -D _BLUE -D _LADIES -h -o $@ $*.asm

pokered_opt  = -Cjv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED"
pokeblue_opt = -Cjv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED"
pokered_ladies_opt  = -Cjv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED"
pokeblue_ladies_opt = -Cjv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "POKEMON RED"

%.gbc: $$(%_obj)
	$(RGBDS_DIR)rgblink -n $*.sym -o $@ $^
	$(RGBDS_DIR)rgbfix $($*_opt) $@
	sort $*.sym -o $*.sym

%.png:  ;
%.2bpp: %.png  ; $(2bpp) $<
%.1bpp: %.png  ; $(1bpp) $<
%.pic:  %.2bpp ; $(pic)  $<
