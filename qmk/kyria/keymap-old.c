#include QMK_KEYBOARD_H

/* THIS FILE WAS GENERATED!
 *
 * This file was generated by qmk json2c. You may or may not want to
 * edit it directly.
 */

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[0] = LAYOUT(KC_GRV, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_MINS, OSM(MOD_LSFT), KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, OSM(MOD_LSFT), KC_BSLS, KC_Z, KC_X, KC_C, KC_V, KC_B, MT(MOD_LCTL, KC_ESC), KC_TAB, KC_CAPS, MT(MOD_LALT, KC_ENT), KC_N, KC_M, KC_COMM, KC_DOT, KC_QUOT, KC_SLSH, OSM(MOD_LCTL), OSM(MOD_HYPR), OSM(MOD_LGUI), KC_BSPC, OSL(2), OSL(1), KC_SPC, OSM(MOD_RCTL), OSM(MOD_LALT), KC_PAUS),
	[1] = LAYOUT(KC_INS, KC_EXLM, KC_AT, KC_HASH, KC_DLR, KC_PERC, KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_MINS, KC_PSCR, KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_SLSH, KC_SLCK, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_DEL, KC_TRNS, KC_TRNS, KC_TRNS, KC_SPC, KC_SPC, KC_COMM, KC_DOT, KC_EQL, KC_PLUS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, OSL(3), KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS),
	[2] = LAYOUT(KC_NO, KC_VOLU, KC_HOME, KC_UP, KC_PGUP, KC_NO, KC_MPLY, KC_LCBR, KC_RCBR, KC_LBRC, KC_RBRC, RALT(KC_W), KC_NO, KC_VOLD, KC_LEFT, KC_DOWN, KC_RGHT, RCS(KC_TAB), KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, RALT(KC_L), RALT(KC_Z), KC_NO, KC_MUTE, KC_END, KC_MPLY, KC_PGDN, LCTL(KC_TAB), KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_HOME, KC_END, KC_LPRN, KC_RPRN, KC_EQL, KC_PLUS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS),
	[3] = LAYOUT(KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_F12, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS)
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {

    case OSM(MOD_LSFT):
      if ((record->tap.count == 2) && (record->event.pressed)) {
          tap_code16(KC_CAPS);
          return false;
      }
      return true;

    case OSM(MOD_LGUI):
    case OSM(MOD_RGUI):
      if ((record->tap.count >= 2) && (record->event.pressed)) {
          return false;
      }
      return true;

    case OSM(MOD_HYPR):
      if ((record->tap.count >= 2) && (record->event.pressed)) {
          return false;
      }
      return true;

    case OSM(MOD_LCTL):
    case OSM(MOD_RCTL):
      if ((record->tap.count >= 2) && (record->event.pressed)) {
          return false;
      }
      return true;

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
