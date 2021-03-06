"use strict";

const m = require("gl-matrix")

exports.js_add = (a, b) => {
    let out = m.mat2.create()
    return m.mat2.add(out, a, b)
}

exports.js_adjoint = (a) => {
    let out = m.mat2.create()
    return m.mat2.adjoint(out, a)
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

exports.js_frob = (a) => {
    return m.mat2.frob(a)
}

exports.js_fromRotation = (r) => {
    let out = m.mat2.create()
    return m.mat2.fromRotation(out, r)
}

exports.js_fromValues = (m00, m01, m10, m11) => {
    return m.mat2.fromValues(m00, m01, m10, m11)
}

exports.js_identity = () => {
    return m.mat2.create()
}

exports.js_invert = (a) => {
    let out = m.mat2.create()
    return m.mat2.invert(out, a)
}

exports.js_ldu = (a) => {
    let l = m.mat2.create()
    let d = m.mat2.create()
    let u = m.mat2.create()
    return m.mat2.LDU(l, d, u, a)
}

exports.js_multiply = (a, b) => {
    let out = m.mat2.create()
    return m.mat2.multiply(out, a, b)
}

exports.js_multiplyScalar = (a, b) => {
    let out = m.mat2.create()
    return m.mat2.multiplyScalar(out, a, b)
}

exports.js_multiplyScalarAndAdd = (a, b, scale) => {
    let out = m.mat2.create()
    return m.mat2.multiplyScalarAndAdd(out, a, b, scale)
}

exports.js_rotate = (a, r) => {
    let out = m.mat2.create()
    return m.mat2.rotate(out, a, r)
}

exports.js_str = (a) => {
    return m.mat2.str(a)
}

exports.js_subtract = (a, b) => {
    let out = m.mat2.create()
    return m.mat2.subtract(out, a, b)
}

exports.js_transpose = (a) => {
    let out = m.mat2.create()
    return m.mat2.transpose(out, a)
}

exports.js_numbers = (ar) => {
    return Array.prototype.slice.call(ar)
}
