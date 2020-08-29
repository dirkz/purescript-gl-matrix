"use strict";

const m = require("gl-matrix")

exports.js_transformMat2 = (a, mat) => {
    let out = m.vec2.create()
    return m.vec2.transformMat2(out, a, mat)
}
