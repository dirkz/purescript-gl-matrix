"use strict";

const m = require("gl-matrix")

exports.js_fromQuat = (q) => {
    let out = m.mat4.create()
    return m.mat4.fromQuat(out, q)
    return out
}

exports.js_fromRotationTranslation = (q, v) => {
    let out = m.mat4.create()
    return m.mat4.fromRotationTranslation(out, q, v)
    return out
}

exports.js_fromRotationTranslationScale = (q, v, s) => {
    let out = m.mat4.create()
    return m.mat4.fromRotationTranslationScale(out, q, v, s)
    return out
}

exports.js_fromRotationTranslationScaleOrigin = (q, v, s, o) => {
    let out = m.mat4.create()
    return m.mat4.fromRotationTranslationScaleOrigin(out, q, v, s, o)
    return out
}
