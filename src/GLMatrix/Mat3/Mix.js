"use strict";

import * as m from "gl-matrix";

export function js_fromMat2d(m2) {
    let out = m.mat3.create()
    return m.mat3.fromMat2d(out, m2)
}

export function js_fromMat4(mat) {
    let out = m.mat3.create()
    return m.mat3.fromMat4(out, mat)
}

export function js_fromQuat(q) {
    let out = m.mat3.create()
    return m.mat3.fromQuat(out, q)
}

export function js_fromScaling(v2) {
    let out = m.mat3.create()
    return m.mat3.fromScaling(out, v2)
}

export function js_fromTranslation(v2) {
    let out = m.mat3.create()
    return m.mat3.fromTranslation(out, v2)
}

export function js_normalFromMat4(m4) {
    let out = m.mat3.create()
    return m.mat3.normalFromMat4(out, m4)
}

export function js_scale(m3, v2) {
    let out = m.mat3.create()
    return m.mat3.scale(out, m3, v2)
}

export function js_translate(m3, v2) {
    let out = m.mat3.create()
    return m.mat3.translate(out, m3, v2)
}
