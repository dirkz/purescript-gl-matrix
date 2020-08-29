"use strict";

const m = require("gl-matrix")

exports.js_add = (a, b) => {
    let out = m.mat2d.create()
    return m.mat2d.add(out, a, b)
}

exports.js_determinant = (a) => {
    return m.mat2d.determinant(a)
}

exports.js_equals = (a, b) => {
    return m.mat2d.equals(a, b)
}

exports.js_exactEquals = (a, b) => {
    return m.mat2d.exactEquals(a, b)
}

exports.js_frob = (a) => {
    return m.mat2d.frob(a)
}

exports.js_fromRotation = (r) => {
    let out = m.mat2d.create()
    return m.mat2d.fromRotation(out, r)
}

exports.js_fromValues = (a, b, c, d, tx, ty) => {
    return m.mat2d.fromValues(a, b, c, d, tx, ty)
}

exports.js_identity = () => {
    return m.mat2d.create()
}

exports.js_invert = (a) => {
    let out = m.mat2d.create()
    return m.mat2d.invert(out, a)
}

exports.js_multiply = (a, b) => {
    let out = m.mat2d.create()
    return m.mat2d.multiply(out, a, b)
}

exports.js_multiplyScalar = (a, b) => {
    let out = m.mat2d.create()
    return m.mat2d.multiplyScalar(out, a, b)
}

exports.js_multiplyScalarAndAdd = (a, b, scale) => {
    let out = m.mat2d.create()
    return m.mat2d.multiplyScalarAndAdd(out, a, b, scale)
}

exports.js_rotate = (a, r) => {
    let out = m.mat2d.create()
    return m.mat2d.rotate(out, a, r)
}

exports.js_str = (a) => {
    return m.mat2d.str(a)
}

exports.js_subtract = (a, b) => {
    let out = m.mat2d.create()
    return m.mat2d.subtract(out, a, b)
}

exports.js_numbers = (ar) => {
    return Array.prototype.slice.call(ar)
}
