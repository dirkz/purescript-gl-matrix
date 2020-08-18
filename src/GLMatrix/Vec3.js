"use strict";

const m = require("gl-matrix")

exports.js_add = (a, b) => {
    let out = m.vec3.create()
    m.vec3.add(out, a, b)
    return out
}

exports.js_angle = (a, b) => {
    return m.vec3.angle(a, b)
}

exports.js_ceil = (a) => {
    let out = m.vec3.create()
    m.vec3.ceil(out, a)
    return out
}

exports.js_distance = (a, b) => {
    return m.vec3.distance(a, b)
}

exports.js_divide = (a, b) => {
    let out = m.vec3.create()
    m.vec3.divide(out, a, b)
    return out
}

exports.js_dot = (a, b) => {
    return m.vec3.dot(a, b)
}

exports.js_epsilonEquals = (a, b) => {
    return m.vec3.equals(a, b)
}

exports.js_exactEquals = (a, b) => {
    return m.vec3.exactEquals(a, b)
}

exports.js_floor = (a) => {
    let out = m.vec3.create()
    m.vec3.floor(out, a)
    return out
}

exports.js_fromValues = (x, y, z) => {
    return m.vec3.fromValues(x, y, z)
}

exports.js_inverse = (a) => {
    let out = m.vec3.create()
    m.vec3.inverse(out, a)
    return out
}

exports.js_length = (a) => {
    return m.vec3.length(a)
}

exports.js_lerp = (a, b, t) => {
    let out = m.vec3.create()
    m.vec3.lerp(out, a, b, t)
    return out
}

exports.js_max = (a, b) => {
    let out = m.vec3.create()
    m.vec3.max(out, a, b)
    return out
}

exports.js_min = (a, b) => {
    let out = m.vec3.create()
    m.vec3.min(out, a, b)
    return out
}

exports.js_multiply = (a, b) => {
    let out = m.vec3.create()
    m.vec3.multiply(out, a, b)
    return out
}

exports.js_negate = (a) => {
    let out = m.vec3.create()
    m.vec3.negate(out, a)
    return out
}

exports.js_normalize = (a) => {
    let out = m.vec3.create()
    m.vec3.normalize(out, a)
    return out
}

exports.js_rotateX = (a, b, r) => {
    let out = m.vec3.create()
    m.vec3.rotateX(out, a, b, r)
    return out
}

exports.js_rotateY = (a, b, r) => {
    let out = m.vec3.create()
    m.vec3.rotateY(out, a, b, r)
    return out
}

exports.js_rotateZ = (a, b, r) => {
    let out = m.vec3.create()
    m.vec3.rotateZ(out, a, b, r)
    return out
}

exports.js_round = (a) => {
    let out = m.vec3.create()
    m.vec3.round(out, a)
    return out
}

exports.js_scale = (a, b) => {
    let out = m.vec3.create()
    m.vec3.scale(out, a, b)
    return out
}

exports.js_scaleAndAdd = (a, b, scale) => {
    let out = m.vec3.create()
    m.vec3.scaleAndAdd(out, a, b, scale)
    return out
}

exports.js_squaredDistance = (a, b) => {
    return m.vec3.squaredDistance(a, b)
}

exports.js_squaredLength = (a) => {
    return m.vec3.squaredLength(a)
}

exports.js_str = (a) => {
    return m.vec3.str(a)
}

exports.js_subtract = (a, b) => {
    let out = m.vec3.create()
    m.vec3.subtract(out, a, b)
    return out
}

exports.js_zero = () => {
    let out = m.vec3.create()
    m.vec3.zero(out)
    return out
}

exports.js_numbers = (ar) => {
    return Array.prototype.slice.call(ar)
}
