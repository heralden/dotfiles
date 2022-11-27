/* Copyright 2020 Purdea Andrei
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

// Defines names for use in layer keycodes and the keymap
enum layer_names {
    _BASE,
    _FN,
    _FN2
};

// Defines the keycodes used by our macros in process_record_user
enum custom_keycodes {
    QMKBEST = SAFE_RANGE,
    QMKURL
};

#define OSM_LSFT OSM(MOD_LSFT)
#define FN_BSPC LT(_FN, KC_BSPC)
#define NEXT_TAB LCTL(KC_TAB)
#define PREV_TAB LCTL(LSFT(KC_TAB))

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    /* Base */
    [_BASE] = LAYOUT_ansi_hhkb_split_shift_split_backspace(
        KC_GRV, KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_MINS, KC_EQL, KC_NO, KC_BSLS,     KC_P7,   KC_P8,   KC_P9,
        KC_ESC,    KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_LPRN, KC_RPRN, KC_TAB,         KC_P4,   KC_P5,   KC_P6,
        FN_BSPC,      KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT, KC_ENT,            KC_P1,   KC_P2,   KC_P3,
        OSM_LSFT,        KC_Z, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_RSFT, MO(_FN),   KC_P0,   KC_UP,   KC_PDOT,
        KC_LGUI, KC_LCTL, KC_LALT,                      KC_SPC,                  KC_RALT, KC_RCTL, KC_RGUI,      KC_LEFT, KC_DOWN, KC_RIGHT
    ),
    [_FN] = LAYOUT_ansi_hhkb_split_shift_split_backspace(
        _______, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, _______, KC_CAPS,     KC_HOME,   KC_UP,   KC_PGUP,
        _______,    KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_LCBR, KC_RCBR, KC_NO,            PREV_TAB,  KC_NO,   NEXT_TAB,
        _______,      KC_NO, KC_NO, KC_NO, KC_NO, PREV_TAB, KC_LEFT, KC_DOWN, KC_UP, KC_RIGHT, KC_NO, KC_NO, KC_NO,           KC_END,    KC_DOWN, KC_PGDN,
        _______,         KC_NO, KC_NO, KC_NO, KC_NO, NEXT_TAB, KC_NO, KC_NO, KC_PSCR, KC_SLCK, KC_PAUS, _______, _______,     KC_INS,    KC_VOLU, KC_DEL,
        _______, _______, _______,                             MO(_FN2),                       _______, _______, _______,     KC_MUTE,   KC_VOLD, KC_MPLY
    ),
    [_FN2] = LAYOUT_ansi_hhkb_split_shift_split_backspace(
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,    _______, _______, _______,
        _______,     _______, _______, EEPROM_RESET, RESET, _______, _______, _______, _______, _______, _______, _______, _______, _______,      _______, _______, _______,
        _______,         _______, _______, DEBUG, _______, _______, _______, _______, _______, _______, _______, _______, _______,                _______, _______, _______,
        _______,             _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, _______,
        _______, _______, _______,                             _______,                                       _______, _______, _______,          _______, _______, _______
    )
};

const key_override_t left_lisp_paren_key = ko_make_basic(MOD_MASK_SHIFT, KC_LPRN, KC_LBRC);
const key_override_t right_lisp_paren_key = ko_make_basic(MOD_MASK_SHIFT, KC_RPRN, KC_RBRC);

const key_override_t **key_overrides = (const key_override_t *[]){
    &left_lisp_paren_key,
    &right_lisp_paren_key,
    NULL
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case QMKBEST:
            if (record->event.pressed) {
                // when keycode QMKBEST is pressed
                SEND_STRING("QMK is the best thing ever!");
            } else {
                // when keycode QMKBEST is released
            }
            break;
        case QMKURL:
            if (record->event.pressed) {
                // when keycode QMKURL is pressed
                SEND_STRING("https://qmk.fm/\n");
            } else {
                // when keycode QMKURL is released
            }
            break;
    }
    return true;
}

/*
void matrix_init_user(void) {

}

void matrix_scan_user(void) {

}

bool led_update_user(led_t led_state) {
    return true;
}
*/
