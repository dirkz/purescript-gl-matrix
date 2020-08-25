"use strict";

const m = require("gl-matrix")

exports.js_rotationTo = (a, b) => {
    let out = m.quat.create()
    m.quat.rotationTo(out, a, b)
    return out
}
