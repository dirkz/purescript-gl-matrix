"use strict";

const m = require("gl-matrix")

exports.js_fromValues = (m00, m01, m10, m11) => {
    return m.mat2.fromValues(m00, m01, m10, m11)
}

exports.js_add = (a, b) => {
    let out = m.mat2.create()
    m.mat2.add(out, a, b)
    return out
}