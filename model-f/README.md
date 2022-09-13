### Flashing the Model F reproduction keyboard
- Open http://35.164.28.200:5000/#/xwhatsit/brand_new_model_f/f77/wcass/LAYOUT_all and click the button to the right of *KEYMAP.JSON* to select the `.json` file and upload it
- Make changes to the keymap by drag-and-dropping keys from below
- Click *Compile* and then *Firmware* to download it
- Hold both shifts on the keyboard and press **B** to enter the bootloader
- Start *QMK Toolbox*, ensure MCU is set to **ATmega32U2**, click *Open* to select the `.hex` file, and finally click *Flash*

If you experience issues, ensure the keyboard is connected directly to your computer and not through a USB hub.
