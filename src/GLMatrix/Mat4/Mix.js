"use strict";

import m from "gl-matrix";

export function js_fromQuat(q) {
    let out = m.mat4.create()
    return m.mat4.fromQuat(out, q)
}

export function js_fromRotationTranslation(q, v) {
    let out = m.mat4.create()
    return m.mat4.fromRotationTranslation(out, q, v)
}

export function js_fromRotationTranslationScale(q, v, s) {
    let out = m.mat4.create()
    return m.mat4.fromRotationTranslationScale(out, q, v, s)
}

export function js_fromRotationTranslationScaleOrigin(q, v, s, o) {
    let out = m.mat4.create()
    return m.mat4.fromRotationTranslationScaleOrigin(out, q, v, s, o)
}

export function js_getRotation(mat) {
    let out = m.quat.create()
    return m.mat4.getRotation(out, mat)
}
