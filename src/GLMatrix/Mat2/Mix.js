"use strict";

const m = require("gl-matrix")

exports.js_fromMat2d = (m2) => {
    let out = m.mat2.create()
    return m.mat2.fromMat2d(out, m2)
    return out
}

exports.js_fromScaling = (r) => {
    let out = m.mat2.create()
    return m.mat2.fromScaling(out, r)
    return out
}

exports.js_scale = (a, v) => {
    let out = m.mat2.create()
    m.mat2.scale(out, a, v)
    return out
}