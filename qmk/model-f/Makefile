qmk_dir = $(HOME)/.local/share/qmk_firmware_pandrew
keymap_dir = $(qmk_dir)/keyboards/xwhatsit/brand_new_model_f/f77/keymaps/heralden
python_version = 3.8.14

$(keymap_dir):
	mkdir $(keymap_dir)
	ln -s $(PWD)/keymap.c $(keymap_dir)
	ln -s $(PWD)/rules.mk $(keymap_dir)

setup:
	pyenv install --skip-existing $(python_version)
	pyenv virtualenvs | grep qmk_firmware_pandrew || pyenv virtualenv $(python_version) qmk_firmware_pandrew
	( \
		. $(HOME)/.pyenv/versions/qmk_firmware_pandrew/bin/activate && \
		pip install qmk==0.0.30 && \
		qmk setup -b wip --baseurl http://purdea.ro qmk_firmware $(qmk_dir) \
	)

flash: $(keymap_dir)
	( \
		. $(HOME)/.pyenv/versions/qmk_firmware_pandrew/bin/activate && \
		qmk config user.qmk_home=$(qmk_dir) && \
		qmk flash -kb xwhatsit/brand_new_model_f/f77/wcass -km heralden \
	)

.PHONY: setup flash
