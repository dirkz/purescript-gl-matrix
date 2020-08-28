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
    return m.quat.fromValues(x, y, z, w)
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

exports.js_multiply = (a, b) => {
    let out = m.quat.create()
    m.quat.multiply(out, a, b)
    return out
}

exports.js_normalize = (a) => {
    let out = m.quat.create()
    m.quat.normalize(out, a)
    return out
}

exports.js_pow = (a, b) => {
    let out = m.quat.create()
    m.quat.pow(out, a, b)
    return out
}

exports.js_rotateX = (a, r) => {
    let out = m.quat.create()
    m.quat.rotateX(out, a, r)
    return out
}

exports.js_rotateY = (a, r) => {
    let out = m.quat.create()
    m.quat.rotateY(out, a, r)
    return out
}

exports.js_rotateZ = (a, r) => {
    let out = m.quat.create()
    m.quat.rotateZ(out, a, r)
    return out
}

exports.js_scale = (a, s) => {
    let out = m.quat.create()
    m.quat.scale(out, a, s)
    return out
}

exports.js_slerp = (a, b, t) => {
    let out = m.quat.create()
    m.quat.slerp(out, a, b, t)
    return out
}

exports.js_squaredLength = (a) => {
    return m.quat.squaredLength(a)
}

exports.js_str = (a) => {
    return m.quat.str(a)
}

exports.js_numbers = (ar) => {
    return Array.prototype.slice.call(ar)
}
