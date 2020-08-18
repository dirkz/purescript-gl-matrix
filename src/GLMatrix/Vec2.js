"use strict";

const m = require("gl-matrix")

exports.js_add = (a, b) => {
    let out = m.vec2.create()
    m.vec2.add(out, a, b)
    return out
}

exports.js_angle = (a, b) => {
    return m.vec2.angle(a, b)
}

exports.js_ceil = (a) => {
    let out = m.vec2.create()
    m.vec2.ceil(out, a)
    return out
}

exports.js_distance = (a, b) => {
    return m.vec2.distance(a, b)
}

exports.js_divide = (a, b) => {
    let out = m.vec2.create()
    m.vec2.divide(out, a, b)
    return out
}

exports.js_dot = (a, b) => {
    return m.vec2.dot(a, b)
}

exports.js_epsilonEquals = (a, b) => {
    return m.vec2.equals(a, b)
}

exports.js_exactEquals = (a, b) => {
    return m.vec2.exactEquals(a, b)
}

exports.js_floor = (a) => {
    let out = m.vec2.create()
    m.vec2.floor(out, a)
    return out
}

exports.js_fromValues = (x, y) => {
    return m.vec2.fromValues(x, y)
}

exports.js_inverse = (a) => {
    let out = m.vec2.create()
    m.vec2.inverse(out, a)
    return out
}

exports.js_length = (a) => {
    return m.vec2.length(a)
}

exports.js_lerp = (a, b, t) => {
    let out = m.vec2.create()
    m.vec2.lerp(out, a, b, t)
    return out
}

exports.js_max = (a, b) => {
    let out = m.vec2.create()
    m.vec2.max(out, a, b)
    return out
}

exports.js_min = (a, b) => {
    let out = m.vec2.create()
    m.vec2.min(out, a, b)
    return out
}

exports.js_multiply = (a, b) => {
    let out = m.vec2.create()
    m.vec2.multiply(out, a, b)
    return out
}

exports.js_negate = (a) => {
    let out = m.vec2.create()
    m.vec2.negate(out, a)
    return out
}

exports.js_normalize = (a) => {
    let out = m.vec2.create()
    m.vec2.normalize(out, a)
    return out
}

exports.js_rotate = (a, b, r) => {
    let out = m.vec2.create()
    m.vec2.rotate(out, a, b, r)
    return out
}

exports.js_round = (a) => {
    let out = m.vec2.create()
    m.vec2.round(out, a)
    return out
}

exports.js_scale = (a, b) => {
    let out = m.vec2.create()
    m.vec2.scale(out, a, b)
    return out
}

exports.js_scaleAndAdd = (a, b, scale) => {
    let out = m.vec2.create()
    m.vec2.scaleAndAdd(out, a, b, scale)
    return out
}

exports.js_squaredDistance = (a, b) => {
    return m.vec2.squaredDistance(a, b)
}

exports.js_squaredLength = (a) => {
    return m.vec2.squaredLength(a)
}

exports.js_str = (a) => {
    return m.vec2.str(a)
}

exports.js_subtract = (a, b) => {
    let out = m.vec2.create()
    m.vec2.subtract(out, a, b)
    return out
}

exports.js_transformMat3 = (a, mat) => {
    let out = m.vec2.create()
    m.vec2.transformMat3(out, a, mat)
    return out
}

exports.js_zero = () => {
    let out = m.vec2.create()
    m.vec2.zero(out)
    return out
}

exports.js_numbers = (ar) => {
    return Array.prototype.slice.call(ar)
}
