#include QMK_KEYBOARD_H

enum layers {
  _QWERTY,
  _NUMSYM,
  _FN,
  _FKEYS,
};

#define NUMSYM MO(_NUMSYM)
#define FN MO(_FN)

#define OSM_SFT     OSM(MOD_LSFT)
#define OSM_LCG     OSM(MOD_LGUI | MOD_LCTL)

#define ALT_SPC     MT(MOD_LALT, KC_SPC)
#define GUI_BSP     MT(MOD_LGUI, KC_BSPC)

#define NEXT_TAB    LCTL(KC_TAB)
#define PREV_TAB    RCS(KC_TAB)

const uint16_t PROGMEM jl_combo[] = {KC_J, KC_L, COMBO_END};
const uint16_t PROGMEM sf_combo[] = {KC_S, KC_F, COMBO_END};
combo_t key_combos[COMBO_COUNT] = {
    COMBO(jl_combo, KC_ENT),
    COMBO(sf_combo, KC_ESC),
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_QWERTY] = LAYOUT_ortho_4x12(
    KC_GRV,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_MINS,
    OSM_SFT, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, OSM_SFT,
    KC_BSLS, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_QUOT, KC_SLSH,
    KC_NO,   KC_NO,   KC_NO,   OSM_LCG, GUI_BSP, FN,      NUMSYM,  ALT_SPC, KC_LCTL, KC_NO,   KC_NO,   KC_NO
  ),
  [_NUMSYM] = LAYOUT_ortho_4x12(
    KC_INS,  KC_EXLM, KC_AT,   KC_HASH, KC_DLR,  KC_PERC, KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_MINS,
    KC_PSCR, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_PLUS,
    KC_SCRL, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_SPC,  KC_COMM, KC_DOT,  KC_EQL,  KC_SLSH,
    KC_F7,   KC_F8,   KC_F9, _______, _______, _______, _______, _______, _______,   KC_F10,   KC_F11,  KC_F12
  ),
  [_FN] = LAYOUT_ortho_4x12(
    KC_NO,   KC_NO,   KC_MUTE, KC_NO,   KC_NO,   KC_MPLY,  KC_MPLY, KC_LCBR, KC_RCBR, KC_LBRC, KC_RBRC, KC_NO,
    KC_NO,   KC_BRMU, KC_VOLU, KC_HOME, KC_PGUP, PREV_TAB, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_NO,   KC_NO,
    KC_NO,   KC_BRMD, KC_VOLD, KC_END,  KC_PGDN, NEXT_TAB, KC_NO,   KC_NO,   KC_LPRN, KC_RPRN, KC_EQL,  KC_PLUS,
    _______, _______, _______, _______, KC_DEL,  _______, _______,  KC_TAB, _______, _______, _______, _______
  )
};
