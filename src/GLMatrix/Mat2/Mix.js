"use strict";

import m from "gl-matrix";

export function js_fromScaling(r) {
    let out = m.mat2.create()
    return m.mat2.fromScaling(out, r)
}

export function js_scale(a, v) {
    let out = m.mat2.create()
    return m.mat2.scale(out, a, v)
}