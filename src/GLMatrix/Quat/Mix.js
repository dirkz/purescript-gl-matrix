"use strict";

const m = require("gl-matrix")

exports.js_rotationTo = (a, b) => {
    return m.quat.rotationTo(a, b)
}
