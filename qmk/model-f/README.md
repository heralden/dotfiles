Requires `python3-pip`, `pyenv` and `pyenv-virtualenv`. Yes, that is because this firmware has never been merged upstream and depends on an archaic version of QMK, its dependencies, and Python. Yes, writing the Makefile to contain this atrocious ecosystem was a nightmare.

To avoid using `sudo` when flashing firmware on Linux, [add udev rules](https://docs.qmk.fm/#/faq_build?id=linux-udev-rules).

```
make setup
make flash
```
Hold both shifts on the keyboard and press **B** to enter the bootloader, for flashing to complete.

If you experience issues, ensure the keyboard is connected directly to your computer and not through a USB hub.
