"use strict";

const m = require("gl-matrix")

exports.js_fromScaling = (r) => {
    let out = m.mat2d.create()
    return m.mat2d.fromScaling(out, r)
}

exports.js_fromTranslation = (v) => {
    let out = m.mat2d.create()
    return m.mat2d.fromTranslation(out, v)
}

exports.js_scale = (a, v) => {
    let out = m.mat2d.create()
    return m.mat2d.scale(out, a, v)
}

exports.js_translate = (a, v) => {
    let out = m.mat2d.create()
    return m.mat2d.translate(out, a, v)
}
