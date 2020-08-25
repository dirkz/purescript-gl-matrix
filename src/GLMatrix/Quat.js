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
