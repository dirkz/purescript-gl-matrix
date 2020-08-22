"use strict";

const m = require("gl-matrix")

exports.js_fromScaling = (v) => {
    let out = m.mat3.create()
    m.mat3.fromScaling(out, v)
    return out
}
