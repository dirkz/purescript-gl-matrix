"use strict";

const m = require("gl-matrix")

exports.js_add = (a, b) => {
    let out = m.mat3.create()
    m.mat3.add(out, a, b)
    return out
}

exports.js_adjoint = (a) => {
    let out = m.mat3.create()
    m.mat3.adjoint(out, a)
    return out
}

exports.js_determinant = (a) => {
    return m.mat3.determinant(a)
}

exports.js_epsilonEquals = (a, b) => {
    return m.mat3.equals(a, b)
}

exports.js_exactEquals = (a, b) => {
    return m.mat3.exactEquals(a, b)
}

exports.js_frob = (a) => {
    return m.mat3.frob(a)
}

exports.js_fromRotation = (r) => {
    let out = m.mat3.create()
    m.mat3.fromRotation(out, r)
    return out
}

exports.js_fromValues = (m00, m01, m02, m10, m11, m12, m20, m21, m22) => {
    return m.mat3.fromValues(m00, m01, m02, m10, m11, m12, m20, m21, m22)
}

exports.js_identity = () => {
    return m.mat3.create()
}

exports.js_invert = (a) => {
    let out = m.mat3.create()
    m.mat3.invert(out, a)
    return out
}

exports.js_multiply = (a, b) => {
    let out = m.mat3.create()
    m.mat3.multiply(out, a, b)
    return out
}

exports.js_multiplyScalar = (a, b) => {
    let out = m.mat3.create()
    m.mat3.multiplyScalar(out, a, b)
    return out
}

exports.js_multiplyScalarAndAdd = (a, b, scale) => {
    let out = m.mat3.create()
    m.mat3.multiplyScalarAndAdd(out, a, b, scale)
    return out
}

exports.js_normalFromMat4 = (a) => {
    let out = m.mat3.create()
    m.mat3.normalFromMat4(out, a)
    return out
}

exports.js_projection = (w, h) => {
    let out = m.mat3.create()
    m.mat3.projection(out, w, h)
    return out
}

exports.js_rotate = (a, r) => {
    let out = m.mat3.create()
    m.mat3.rotate(out, a, r)
    return out
}

exports.js_str = (a) => {
    return m.mat3.str(a)
}

exports.js_subtract = (a, b) => {
    let out = m.mat3.create()
    m.mat3.subtract(out, a, b)
    return out
}

exports.js_transpose = (a) => {
    let out = m.mat3.create()
    m.mat3.transpose(out, a)
    return out
}

exports.js_numbers = (ar) => {
    return Array.prototype.slice.call(ar)
}
