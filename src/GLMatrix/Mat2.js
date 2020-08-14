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

exports.js_frob = (a) => {
    return m.mat2.frob(a)
}

exports.js_fromRotation = (r) => {
    let out = m.mat2.create()
    m.mat2.fromRotation(out, r)
    return out
}

exports.js_fromScaling = (r) => {
    let out = m.mat2.create()
    m.mat2.fromScaling(out, r)
    return out
}

exports.js_identity = () => {
    let out = m.mat2.create()
    m.mat2.identity(out)
    return out
}

exports.js_invert = (a) => {
    let out = m.mat2.create()
    m.mat2.invert(out, a)
    return out
}

exports.js_ldu = (a) => {
    let l = m.mat2.create()
    let d = m.mat2.create()
    let u = m.mat2.create()
    return m.mat2.ldu(l, d, u, a)
}

