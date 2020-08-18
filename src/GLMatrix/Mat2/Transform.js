"use strict";

const m = require("gl-matrix")

exports.js_scale = (a, v) => {
    let out = m.mat2.create()
    m.mat2.scale(out, a, v)
    return out
}