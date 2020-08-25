"use strict";

const m = require("gl-matrix")

exports.js_equals = (a, b) => {
    return m.quat.equals(a, b)
}

exports.js_exactEquals = (a, b) => {
    return m.quat.exactEquals(a, b)
}

exports.js_length = (a) => {
    return m.quat.length(a)
}
