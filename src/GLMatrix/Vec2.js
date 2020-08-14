"use strict";

const m = require("gl-matrix")

exports.js_add = (a, b) => {
    let out = m.vec2.create()
    m.vec2.add(out, a, b)
    return out
}
