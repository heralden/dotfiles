keymap_dir = $(HOME)/qmk_firmware/keyboards/splitkb/kyria/keymaps/uosl

$(keymap_dir):
	mkdir $(keymap_dir)
	ln -s $(PWD)/config.h $(keymap_dir)
	ln -s $(PWD)/keymap.c $(keymap_dir)
	ln -s $(PWD)/rules.mk $(keymap_dir)

setup:
	python3 -m pip install --user qmk
	qmk setup

flash-left: $(keymap_dir)
	qmk flash -kb splitkb/kyria -km uosl -bl avrdude

flash-right: $(keymap_dir)
	qmk flash -kb splitkb/kyria -km uosl -bl avrdude-split-right

.PHONY: setup flash-left flash-right
