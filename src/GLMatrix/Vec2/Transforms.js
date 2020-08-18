"use strict";

const m = require("gl-matrix")

exports.js_transformMat2 = (a, mat) => {
    let out = m.vec2.create()
    m.vec2.transformMat2(out, a, mat)
    return out
}

exports.js_fromScaling = (v) => {
    let out = m.mat2.create()
    m.mat2.fromScaling(out, v)
    return out
}
