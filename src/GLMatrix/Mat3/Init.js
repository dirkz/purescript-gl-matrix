"use strict";

const m = require("gl-matrix")

exports.js_fromMat4 = (mat) => {
    let out = m.mat3.create()
    return m.mat3.fromMat4(out, mat)
    return out
}
