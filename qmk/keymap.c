/* Copyright 2019 Thomas Baart <thomas@splitkb.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#include QMK_KEYBOARD_H

enum layers {
    _QWERTY = 0,
    _NUMSYM,
    _FN,
    _FKEYS,
};


// Aliases for readability
#define QWERTY   OSL(_QWERTY)
#define NUMSYM   OSL(_NUMSYM)
#define FN       OSL(_FN)
#define FKEYS    OSL(_FKEYS)

/* #define CTL_ESC  MT(MOD_LCTL, KC_ESC) */
/* #define CTL_QUOT MT(MOD_RCTL, KC_QUOTE) */
/* #define CTL_MINS MT(MOD_RCTL, KC_MINUS) */
/* #define ALT_ENT  MT(MOD_LALT, KC_ENT) */

#define OSM_SFT     OSM(MOD_LSFT)
#define OSM_RCTL    OSM(MOD_RCTL)
#define OSM_LALT    OSM(MOD_LALT)
#define OSM_LAG     OSM(MOD_LGUI | MOD_LALT)
#define OSM_LCG     OSM(MOD_LGUI | MOD_LCTL)
#define OSM_GUI     OSM(MOD_LGUI)

#define GUI_ESC     MT(MOD_LGUI, KC_ESC)
#define CTL_TAB     MT(MOD_LCTL, KC_TAB)
#define GUI_CAP     MT(MOD_LGUI, KC_CAPS)
#define ALT_ENT     MT(MOD_LALT, KC_ENT)

#define NEXT_TAB    LCTL(KC_TAB)
#define PREV_TAB    RCS(KC_TAB)

#define MACBEGLN    LCTL(KC_A)
#define MACENDLN    LCTL(KC_E)

// MacOS
#define NOR_AE      RALT(KC_QUOTE)
#define NOR_OE      RALT(KC_O)
#define NOR_AA      RALT(KC_A)
// Linux
/* #define NOR_AE      RALT(KC_Z) */
/* #define NOR_OE      RALT(KC_L) */
/* #define NOR_AA      RALT(KC_W) */

// Note: LAlt/Enter (ALT_ENT) is not the same thing as the keyboard shortcut Alt+Enter.
// The notation `mod/tap` denotes a key that activates the modifier `mod` when held down, and
// produces the key `tap` when tapped (i.e. pressed and released).

// clang-format off
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
/*
 * Base Layer: QWERTY
 *
 * ,-------------------------------------------.                              ,-------------------------------------------.
 * |  `  ~  |   Q  |   W  |   E  |   R  |   T  |                              |   Y  |   U  |   I  |   O  |   P  |  -  _  |
 * |--------+------+------+------+------+------|                              |------+------+------+------+------+--------|
 * | OSMLSft|   A  |   S  |   D  |   F  |   G  |                              |   H  |   J  |   K  |   L  | ;  : | OSMLsft|
 * |--------+------+------+------+------+------+-------------.  ,-------------+------+------+------+------+------+--------|
 * |  \  |  |   Z  |   X  |   C  |   V  |   B  | Esc  | Tab  |  |CapsLk| Enter|   N  |   M  | ,  < | . >  | '  " |  /  ?  |
 * `----------------------+------+------+------+------+------|  |------+------+------+------+------+----------------------'
 *                        | APP  | OSM  | OSM  | Back | OSL  |  | OSL  | Space| OSM  | OSM | Pause|
 *                        |      | LAG  | LCG  | Space| FN   |  |NUMSYM|      | RCtl | LAlt|      |
 *                        `----------------------------------'  `----------------------------------'
 */
    [_QWERTY] = LAYOUT(
     KC_GRV  , KC_Q ,  KC_W   ,  KC_E  ,   KC_R ,   KC_T ,                                        KC_Y   ,  KC_U ,  KC_I ,   KC_O ,  KC_P , KC_MINS,
     OSM_SFT , KC_A ,  KC_S   ,  KC_D  ,   KC_F ,   KC_G ,                                        KC_H   ,  KC_J ,  KC_K ,   KC_L ,KC_SCLN, OSM_SFT,
     KC_BSLS , KC_Z ,  KC_X   ,  KC_C  ,   KC_V ,   KC_B , GUI_ESC, CTL_TAB,     GUI_CAP, ALT_ENT, KC_N   ,  KC_M ,KC_COMM, KC_DOT ,KC_QUOT, KC_SLSH,
                                 KC_APP,OSM_LAG , OSM_LCG, KC_BSPC, FN     ,     NUMSYM , KC_SPC ,OSM_RCTL,OSM_LALT,KC_PAUS
    ),

/*
 * Layer: Numbers & Symbols
 *
 * ,-------------------------------------------.                              ,-------------------------------------------.
 * | Insert |  !   |   @  |   #  |   $  |   %  |                              |   ^  |   &  |   *  |   (  |   )  |  -  _  |
 * |--------+------+------+------+------+------|                              |------+------+------+------+------+--------|
 * |PrntScrn|  1   |   2  |   3  |   4  |   5  |                              |   6  |   7  |   8  |   9  |   0  |  ?  /  |
 * |--------+------+------+------+------+------+-------------.  ,-------------+------+------+------+------+------+--------|
 * |ScrllLck|  F1  |  F2  |  F3  |  F4  |  F5  |Delete|      |  |      |      | Space| Space| < ,  | > .  | + =  |    +   |
 * `----------------------+------+------+------+------+------|  |------+------+------+------+------+----------------------'
 *                        |      |      |      |      | OSL  |  |      |      |      |      |      |
 *                        |      |      |      |      | FKEYS|  |      |      |      |      |      |
 *                        `----------------------------------'  `----------------------------------'
 */
    [_NUMSYM] = LAYOUT(
     KC_INS  ,KC_EXLM, KC_AT ,KC_HASH, KC_DLR , KC_PERC,                                      KC_CIRC, KC_AMPR,KC_ASTR, KC_LPRN,KC_RPRN, KC_MINS,
     KC_PSCR ,KC_1   , KC_2  ,KC_3   , KC_4   , KC_5   ,                                      KC_6   , KC_7   ,KC_8   , KC_9   ,KC_0   , KC_SLSH,
     KC_SLCK ,KC_F1  , KC_F2 ,KC_F3  , KC_F4  , KC_F5  , KC_DEL, KC_TRNS,    KC_TRNS, KC_TRNS,KC_SPC , KC_SPC ,KC_COMM, KC_DOT ,KC_EQL , KC_PLUS,
                              KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, FKEYS,     KC_TRNS, KC_TRNS,KC_TRNS, KC_TRNS,KC_TRNS
    ),

/*
 * Layer: FN
 *
 * ,-------------------------------------------.                              ,-------------------------------------------.
 * |  F16   | F13  | Mute | Prev | Next | Play |                              | Play |   {  |   }  |   [  |   ]  |   Å    |
 * |--------+------+------+------+------+------|                              |------+------+------+------+------+--------|
 * |  F17   |BriUp | Vol+ | Home | PgUp |PrvTab|                              | Left | Down |  Up  | Right|   Ø  |   Æ    |
 * |--------+------+------+------+------+------+-------------.  ,-------------+------+------+------+------+------+--------|
 * |  F18   |BriDn | Vol- | End  | PgDn |NxtTab|      |      |  |      |      | BegLn| EndLn|   (  |   )  |   =  |   +    |
 * `----------------------+------+------+------+------+------|  |------+------+------+------+------+----------------------'
 *                        |      |      |      |      |      |  |      |      |      |      |      |
 *                        |      |      |      |      |      |  |      |      |      |      |      |
 *                        `----------------------------------'  `----------------------------------'
 */
	  [_FN] = LAYOUT(
     KC_F16  , KC_F13 , KC_MUTE, KC_MPRV, KC_MNXT, KC_MPLY ,                                         KC_MPLY, KC_LCBR,KC_RCBR, KC_LBRC,KC_RBRC, NOR_AA,
     KC_F17  , KC_BRMU, KC_VOLU, KC_HOME, KC_PGUP, PREV_TAB,                                         KC_LEFT, KC_DOWN, KC_UP , KC_RGHT,NOR_OE , NOR_AE,
     KC_F18  , KC_BRMD, KC_VOLD, KC_END , KC_PGDN, NEXT_TAB, KC_TRNS, KC_TRNS,     KC_TRNS, KC_TRNS,MACBEGLN,MACENDLN,KC_LPRN, KC_RPRN,KC_EQL , KC_PLUS,
                                 KC_TRNS, KC_TRNS, KC_TRNS , KC_TRNS, KC_TRNS,     KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS
    ),

/*
 * Layer: FKEYS
 *
 * ,-------------------------------------------.                              ,-------------------------------------------.
 * |        |      |      |      |      |      |                              |      |      |      |      |      |        |
 * |--------+------+------+------+------+------|                              |------+------+------+------+------+--------|
 * |        |  F1  |  F2  |  F3  |  F4  |  F5  |                              |  F6  |  F7  |  F8  |  F9  | F10  |  F11   |
 * |--------+------+------+------+------+------+-------------.  ,-------------+------+------+------+------+------+--------|
 * |        |      |      |      |      |      |      |      |  |      |      |      |      |      |      |      |  F12   |
 * `----------------------+------+------+------+------+------|  |------+------+------+------+------+----------------------'
 *                        |      |      |      |      |      |  |      |      |      |      |      |
 *                        |      |      |      |      |      |  |      |      |      |      |      |
 *                        `----------------------------------'  `----------------------------------'
 */
	  [_FKEYS] = LAYOUT(
      KC_NO  , KC_NO  , KC_NO  , KC_NO  , KC_NO  , KC_NO  ,                                     KC_NO  ,  KC_NO , KC_NO  , KC_NO  , KC_NO  , KC_NO  ,
      KC_NO  , KC_F1  , KC_F2  , KC_F3  , KC_F4  , KC_F5  ,                                     KC_F6  ,  KC_F7 , KC_F8  , KC_F9  , KC_F10 , KC_F11 ,
      KC_NO  , KC_NO  , KC_NO  , KC_NO  , KC_NO  , KC_NO  , KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO  ,  KC_NO , KC_NO  , KC_NO  , KC_NO  , KC_F12 ,
                                 KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS
    ),

// /*
//  * Layer template
//  *
//  * ,-------------------------------------------.                              ,-------------------------------------------.
//  * |        |      |      |      |      |      |                              |      |      |      |      |      |        |
//  * |--------+------+------+------+------+------|                              |------+------+------+------+------+--------|
//  * |        |      |      |      |      |      |                              |      |      |      |      |      |        |
//  * |--------+------+------+------+------+------+-------------.  ,-------------+------+------+------+------+------+--------|
//  * |        |      |      |      |      |      |      |      |  |      |      |      |      |      |      |      |        |
//  * `----------------------+------+------+------+------+------|  |------+------+------+------+------+----------------------'
//  *                        |      |      |      |      |      |  |      |      |      |      |      |
//  *                        |      |      |      |      |      |  |      |      |      |      |      |
//  *                        `----------------------------------'  `----------------------------------'
//  */
//     [_LAYERINDEX] = LAYOUT(
//       _______, _______, _______, _______, _______, _______,                                     _______, _______, _______, _______, _______, _______,
//       _______, _______, _______, _______, _______, _______,                                     _______, _______, _______, _______, _______, _______,
//       _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
//                                  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______
//     ),
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {

    // Tap OSM_SFT twice to toggle caps lock.
    /* case OSM(MOD_LSFT): */
    /*   if ((record->tap.count == 2) && (record->event.pressed)) { */
    /*       tap_code16(KC_CAPS); */
    /*       return false; */
    /*   } */
    /*   return true; */

    // Disable OSM double tap toggle for all others.
    case OSM(MOD_LGUI):
    case OSM(MOD_RGUI):
    case OSM(MOD_HYPR):
    case OSM(MOD_LCTL):
    case OSM(MOD_RCTL):
    case OSM(MOD_LALT):
    case OSM(MOD_RALT):
      if ((record->tap.count >= 2) && (record->event.pressed)) {
          return false;
      }
      return true;


    default:
      return true;
  }

  return true;
}

/* The default OLED and rotary encoder code can be found at the bottom of qmk_firmware/keyboards/splitkb/kyria/rev1/rev1.c
 * These default settings can be overriden by your own settings in your keymap.c
 * For your convenience, here's a copy of those settings so that you can uncomment them if you wish to apply your own modifications.
 * DO NOT edit the rev1.c file; instead override the weakly defined default functions by your own.
 */

/* DELETE THIS LINE TO UNCOMMENT (1/2)
#ifdef OLED_ENABLE
oled_rotation_t oled_init_user(oled_rotation_t rotation) { return OLED_ROTATION_180; }

bool oled_task_user(void) {
    if (is_keyboard_master()) {
        // QMK Logo and version information
        // clang-format off
        static const char PROGMEM qmk_logo[] = {
            0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f,0x90,0x91,0x92,0x93,0x94,
            0xa0,0xa1,0xa2,0xa3,0xa4,0xa5,0xa6,0xa7,0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf,0xb0,0xb1,0xb2,0xb3,0xb4,
            0xc0,0xc1,0xc2,0xc3,0xc4,0xc5,0xc6,0xc7,0xc8,0xc9,0xca,0xcb,0xcc,0xcd,0xce,0xcf,0xd0,0xd1,0xd2,0xd3,0xd4,0};
        // clang-format on

        oled_write_P(qmk_logo, false);
        oled_write_P(PSTR("Kyria rev1.0\n\n"), false);

        // Host Keyboard Layer Status
        oled_write_P(PSTR("Layer: "), false);
        switch (get_highest_layer(layer_state|default_layer_state)) {
            case _QWERTY:
                oled_write_P(PSTR("QWERTY\n"), false);
                break;
            case _DVORAK:
                oled_write_P(PSTR("Dvorak\n"), false);
                break;
            case _COLEMAK_DH:
                oled_write_P(PSTR("Colemak-DH\n"), false);
                break;
            case _NAV:
                oled_write_P(PSTR("Nav\n"), false);
                break;
            case _SYM:
                oled_write_P(PSTR("Sym\n"), false);
                break;
            case _FUNCTION:
                oled_write_P(PSTR("Function\n"), false);
                break;
            case _ADJUST:
                oled_write_P(PSTR("Adjust\n"), false);
                break;
            default:
                oled_write_P(PSTR("Undefined\n"), false);
        }

        // Write host Keyboard LED Status to OLEDs
        led_t led_usb_state = host_keyboard_led_state();
        oled_write_P(led_usb_state.num_lock    ? PSTR("NUMLCK ") : PSTR("       "), false);
        oled_write_P(led_usb_state.caps_lock   ? PSTR("CAPLCK ") : PSTR("       "), false);
        oled_write_P(led_usb_state.scroll_lock ? PSTR("SCRLCK ") : PSTR("       "), false);
    } else {
        // clang-format off
        static const char PROGMEM kyria_logo[] = {
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,128,192,224,240,112,120, 56, 60, 28, 30, 14, 14, 14,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7, 14, 14, 14, 30, 28, 60, 56,120,112,240,224,192,128,128,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            0,  0,  0,  0,  0,  0,  0,192,224,240,124, 62, 31, 15,  7,  3,  1,128,192,224,240,120, 56, 60, 28, 30, 14, 14,  7,  7,135,231,127, 31,255,255, 31,127,231,135,  7,  7, 14, 14, 30, 28, 60, 56,120,240,224,192,128,  1,  3,  7, 15, 31, 62,124,240,224,192,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            0,  0,  0,  0,240,252,255, 31,  7,  1,  0,  0,192,240,252,254,255,247,243,177,176, 48, 48, 48, 48, 48, 48, 48,120,254,135,  1,  0,  0,255,255,  0,  0,  1,135,254,120, 48, 48, 48, 48, 48, 48, 48,176,177,243,247,255,254,252,240,192,  0,  0,  1,  7, 31,255,252,240,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            0,  0,  0,255,255,255,  0,  0,  0,  0,  0,254,255,255,  1,  1,  7, 30,120,225,129,131,131,134,134,140,140,152,152,177,183,254,248,224,255,255,224,248,254,183,177,152,152,140,140,134,134,131,131,129,225,120, 30,  7,  1,  1,255,255,254,  0,  0,  0,  0,  0,255,255,255,  0,  0,  0,  0,255,255,  0,  0,192,192, 48, 48,  0,  0,240,240,  0,  0,  0,  0,  0,  0,240,240,  0,  0,240,240,192,192, 48, 48, 48, 48,192,192,  0,  0, 48, 48,243,243,  0,  0,  0,  0,  0,  0, 48, 48, 48, 48, 48, 48,192,192,  0,  0,  0,  0,  0,
            0,  0,  0,255,255,255,  0,  0,  0,  0,  0,127,255,255,128,128,224,120, 30,135,129,193,193, 97, 97, 49, 49, 25, 25,141,237,127, 31,  7,255,255,  7, 31,127,237,141, 25, 25, 49, 49, 97, 97,193,193,129,135, 30,120,224,128,128,255,255,127,  0,  0,  0,  0,  0,255,255,255,  0,  0,  0,  0, 63, 63,  3,  3, 12, 12, 48, 48,  0,  0,  0,  0, 51, 51, 51, 51, 51, 51, 15, 15,  0,  0, 63, 63,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 48, 48, 63, 63, 48, 48,  0,  0, 12, 12, 51, 51, 51, 51, 51, 51, 63, 63,  0,  0,  0,  0,  0,
            0,  0,  0,  0, 15, 63,255,248,224,128,  0,  0,  3, 15, 63,127,255,239,207,141, 13, 12, 12, 12, 12, 12, 12, 12, 30,127,225,128,  0,  0,255,255,  0,  0,128,225,127, 30, 12, 12, 12, 12, 12, 12, 12, 13,141,207,239,255,127, 63, 15,  3,  0,  0,128,224,248,255, 63, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            0,  0,  0,  0,  0,  0,  0,  3,  7, 15, 62,124,248,240,224,192,128,  1,  3,  7, 15, 30, 28, 60, 56,120,112,112,224,224,225,231,254,248,255,255,248,254,231,225,224,224,112,112,120, 56, 60, 28, 30, 15,  7,  3,  1,128,192,224,240,248,124, 62, 15,  7,  3,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  3,  7, 15, 14, 30, 28, 60, 56,120,112,112,112,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,112,112,112,120, 56, 60, 28, 30, 14, 15,  7,  3,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
        };
        // clang-format on
        oled_write_raw_P(kyria_logo, sizeof(kyria_logo));
    }
    return false;
}
#endif

#ifdef ENCODER_ENABLE
bool encoder_update_user(uint8_t index, bool clockwise) {

    if (index == 0) {
        // Volume control
        if (clockwise) {
            tap_code(KC_VOLU);
        } else {
            tap_code(KC_VOLD);
        }
    } else if (index == 1) {
        // Page up/Page down
        if (clockwise) {
            tap_code(KC_PGDN);
        } else {
            tap_code(KC_PGUP);
        }
    }
    return false;
}
#endif
DELETE THIS LINE TO UNCOMMENT (2/2) */
