"use strict";

const m = require("gl-matrix")

exports.js_transformMat2 = (a, m) => {
    let out = m.vec2.create()
    m.vec2.transformMat2(out, a, m)
    return out
}

exports.js_fromScaling = (v) => {
    let out = m.mat2.create()
    m.mat2.fromScaling(out, v)
    return out
}

exports.js_scale = (a, v) => {
    let out = m.mat2.create()
    m.mat2.scale(out, a, v)
    return out
}