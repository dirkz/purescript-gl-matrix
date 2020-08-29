"use strict";

const m = require("gl-matrix")

exports.js_fromScaling = (r) => {
    let out = m.mat2.create()
    return m.mat2.fromScaling(out, r)
}

exports.js_scale = (a, v) => {
    let out = m.mat2.create()
    return m.mat2.scale(out, a, v)
}