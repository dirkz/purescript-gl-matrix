"use strict";

const m = require("gl-matrix")

exports.js_fromScaling = (v) => {
    let out = m.mat3.create()
    m.mat3.fromScaling(out, v)
    return out
}

exports.js_fromTranslation = (v) => {
    let out = m.mat3.create()
    m.mat3.fromTranslation(out, v)
    return out
}

exports.js_scale = (m3, v2) => {
    let out = m.mat3.create()
    m.mat3.scale(out, m3, v2)
    return out
}
