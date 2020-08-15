"use strict";

const m = require("gl-matrix")

exports.js_numbers = (ar) => {
    Array.prototype.slice.call(ar)
}

exports.js_str = (a) => {
    return m.mat2.str(a)
}

exports.js_epsilonEquals = (a, b) => {
    return m.mat2.equals(a, b)
}

exports.js_exactEquals = (a, b) => {
    return m.mat2.exactEquals(a, b)
}
