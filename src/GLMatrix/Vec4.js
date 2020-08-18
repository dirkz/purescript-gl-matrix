"use strict";

const m = require("gl-matrix")

exports.js_add = (a, b) => {
    let out = m.vec4.create()
    m.vec4.add(out, a, b)
    return out
}

exports.js_ceil = (a) => {
    let out = m.vec4.create()
    m.vec4.ceil(out, a)
    return out
}

exports.js_cross = (u, v, w) => {
    let out = m.vec4.create()
    m.vec4.cross(out, u, v, w)
    return out
}

exports.js_distance = (a, b) => {
    return m.vec4.distance(a, b)
}

exports.js_divide = (a, b) => {
    let out = m.vec4.create()
    m.vec4.divide(out, a, b)
    return out
}

exports.js_dot = (a, b) => {
    return m.vec4.dot(a, b)
}

exports.js_epsilonEquals = (a, b) => {
    return m.vec4.equals(a, b)
}

exports.js_exactEquals = (a, b) => {
    return m.vec4.exactEquals(a, b)
}

exports.js_floor = (a) => {
    let out = m.vec4.create()
    m.vec4.floor(out, a)
    return out
}

exports.js_fromValues = (x, y, z, h) => {
    return m.vec4.fromValues(x, y, z, h)
}

exports.js_inverse = (a) => {
    let out = m.vec4.create()
    m.vec4.inverse(out, a)
    return out
}

exports.js_length = (a) => {
    return m.vec4.length(a)
}

exports.js_lerp = (a, b, t) => {
    let out = m.vec4.create()
    m.vec4.lerp(out, a, b, t)
    return out
}

exports.js_max = (a, b) => {
    let out = m.vec4.create()
    m.vec4.max(out, a, b)
    return out
}

exports.js_min = (a, b) => {
    let out = m.vec4.create()
    m.vec4.min(out, a, b)
    return out
}

exports.js_multiply = (a, b) => {
    let out = m.vec4.create()
    m.vec4.multiply(out, a, b)
    return out
}

exports.js_negate = (a) => {
    let out = m.vec4.create()
    m.vec4.negate(out, a)
    return out
}

exports.js_normalize = (a) => {
    let out = m.vec4.create()
    m.vec4.normalize(out, a)
    return out
}

exports.js_rotateX = (a, b, r) => {
    let out = m.vec4.create()
    m.vec4.rotateX(out, a, b, r)
    return out
}

exports.js_rotateY = (a, b, r) => {
    let out = m.vec4.create()
    m.vec4.rotateY(out, a, b, r)
    return out
}

exports.js_rotateZ = (a, b, r) => {
    let out = m.vec4.create()
    m.vec4.rotateZ(out, a, b, r)
    return out
}

exports.js_round = (a) => {
    let out = m.vec4.create()
    m.vec4.round(out, a)
    return out
}

exports.js_scale = (a, b) => {
    let out = m.vec4.create()
    m.vec4.scale(out, a, b)
    return out
}

exports.js_scaleAndAdd = (a, b, scale) => {
    let out = m.vec4.create()
    m.vec4.scaleAndAdd(out, a, b, scale)
    return out
}

exports.js_squaredDistance = (a, b) => {
    return m.vec4.squaredDistance(a, b)
}

exports.js_squaredLength = (a) => {
    return m.vec4.squaredLength(a)
}

exports.js_str = (a) => {
    return m.vec4.str(a)
}

exports.js_subtract = (a, b) => {
    let out = m.vec4.create()
    m.vec4.subtract(out, a, b)
    return out
}

exports.js_transformMat3 = (a, mat) => {
    let out = m.vec4.create()
    m.vec4.transformMat3(out, a, mat)
    return out
}

exports.js_zero = () => {
    let out = m.vec4.create()
    m.vec4.zero(out)
    return out
}

exports.js_numbers = (ar) => {
    return Array.prototype.slice.call(ar)
}
