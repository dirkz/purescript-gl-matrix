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

exports.js_sqlerp = (a, b, c, d, t) => {
    let out = m.quat.create()
    m.quat.sqlerp(out, a, b, c, d, t)
    return out
}

exports.js_add = (a, b) => {
    let out = m.quat.create()
    m.quat.add(out, a, b)
    return out
}

exports.js_calculateW = (a) => {
    let out = m.quat.create()
    m.quat.calculateW(out, a)
    return out
}

exports.js_conjugate = (a) => {
    let out = m.quat.create()
    m.quat.conjugate(out, a)
    return out
}

exports.js_dot = (a, b) => {
    let out = m.quat.create()
    m.quat.dot(out, a, b)
    return out
}

exports.js_exp = (a) => {
    let out = m.quat.create()
    m.quat.exp(out, a)
    return out
}

exports.js_fromEuler = (x, y, z) => {
    let out = m.quat.create()
    m.quat.fromEuler(out, x, y, z)
    return out
}

exports.js_fromValues = (x, y, z, w) => {
    let out = m.quat.create()
    m.quat.fromValues(out, x, y, z, w)
    return out
}

exports.js_getAngle = (a, b) => {
    return m.quat.getAngle(a, b)
}

exports.js_identity = () => {
    let out = m.quat.create()
    m.quat.identity(out)
    return out
}

exports.js_invert = (a) => {
    let out = m.quat.create()
    m.quat.invert(out, a)
    return out
}

exports.js_lerp = (a, b, t) => {
    let out = m.quat.create()
    m.quat.lerp(out, a, b, t)
    return out
}

exports.js_ln = (a) => {
    let out = m.quat.create()
    m.quat.ln(out, a)
    return out
}

