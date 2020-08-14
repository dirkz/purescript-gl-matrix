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

exports.js_adjoint = (a) => {
    let out = m.mat2.create()
    m.mat2.adjoint(a)
    return out
}

exports.js_determinant = (a) => {
    return m.mat2.determinant(a)
}

exports.js_equals = (a, b) => {
    return m.mat2.equals(a, b)
}

exports.js_exactEquals = (a, b) => {
    return m.mat2.exactEquals(a, b)
}
