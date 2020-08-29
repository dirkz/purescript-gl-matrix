"use strict";

const m = require("gl-matrix")

exports.js_fromQuat = (q) => {
    let out = m.mat4.create()
    return m.mat4.fromQuat(out, q)
    return out
}
