qmk_dir = $(HOME)/.local/share/qmk_firmware
keymap_dir = $(qmk_dir)/keyboards/splitkb/kyria/keymaps/heralden

$(keymap_dir):
	mkdir $(keymap_dir)
	ln -s $(PWD)/config.h $(keymap_dir)
	ln -s $(PWD)/keymap.c $(keymap_dir)
	ln -s $(PWD)/rules.mk $(keymap_dir)

setup:
	python3 -m pip install --user qmk
	qmk setup -H $(qmk_dir)

flash-left: $(keymap_dir)
	qmk config user.qmk_home=$(qmk_dir)
	qmk flash -kb splitkb/kyria -km heralden -bl avrdude

flash-right: $(keymap_dir)
	qmk config user.qmk_home=$(qmk_dir)
	qmk flash -kb splitkb/kyria -km heralden -bl avrdude-split-right

.PHONY: setup flash-left flash-right
