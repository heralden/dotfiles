qmk_dir = $(HOME)/.local/share/qmk_firmware
keymap_dir = $(qmk_dir)/keyboards/boardsource/4x12/keymaps/heralden

$(keymap_dir):
	mkdir $(keymap_dir)
	ln -s $(PWD)/config.h $(keymap_dir)
	ln -s $(PWD)/keymap.c $(keymap_dir)
	ln -s $(PWD)/rules.mk $(keymap_dir)

setup:
	python3 -m pip install --user qmk
	qmk setup -H $(qmk_dir)

flash: $(keymap_dir)
	qmk config user.qmk_home=$(qmk_dir)
	qmk flash -kb boardsource/4x12 -km heralden -e CONVERT_TO=rp2040_ce

.PHONY: setup flash
