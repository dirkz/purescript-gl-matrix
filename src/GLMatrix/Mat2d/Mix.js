"use strict";

import * as m from "gl-matrix";

export function js_fromScaling(r) {
    let out = m.mat2d.create()
    return m.mat2d.fromScaling(out, r)
}

export function js_fromTranslation(v) {
    let out = m.mat2d.create()
    return m.mat2d.fromTranslation(out, v)
}

export function js_scale(a, v) {
    let out = m.mat2d.create()
    return m.mat2d.scale(out, a, v)
}

export function js_translate(a, v) {
    let out = m.mat2d.create()
    return m.mat2d.translate(out, a, v)
}
