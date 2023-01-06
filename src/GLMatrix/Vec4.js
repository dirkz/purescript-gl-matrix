"use strict";

import * as m from "gl-matrix";

export function js_add(a, b) {
    let out = m.vec4.create()
    return m.vec4.add(out, a, b)
}

export function js_ceil(a) {
    let out = m.vec4.create()
    return m.vec4.ceil(out, a)
}

export function js_cross(u, v, w) {
    let out = m.vec4.create()
    return m.vec4.cross(out, u, v, w)
}

export function js_distance(a, b) {
    return m.vec4.distance(a, b)
}

export function js_divide(a, b) {
    let out = m.vec4.create()
    return m.vec4.divide(out, a, b)
}

export function js_dot(a, b) {
    return m.vec4.dot(a, b)
}

export function js_equals(a, b) {
    return m.vec4.equals(a, b)
}

export function js_exactEquals(a, b) {
    return m.vec4.exactEquals(a, b)
}

export function js_floor(a) {
    let out = m.vec4.create()
    return m.vec4.floor(out, a)
}

export function js_fromValues(x, y, z, h) {
    return m.vec4.fromValues(x, y, z, h)
}

export function js_inverse(a) {
    let out = m.vec4.create()
    return m.vec4.inverse(out, a)
}

export function js_length(a) {
    return m.vec4.length(a)
}

export function js_lerp(a, b, t) {
    let out = m.vec4.create()
    return m.vec4.lerp(out, a, b, t)
}

export function js_max(a, b) {
    let out = m.vec4.create()
    return m.vec4.max(out, a, b)
}

export function js_min(a, b) {
    let out = m.vec4.create()
    return m.vec4.min(out, a, b)
}

export function js_multiply(a, b) {
    let out = m.vec4.create()
    return m.vec4.multiply(out, a, b)
}

export function js_negate(a) {
    let out = m.vec4.create()
    return m.vec4.negate(out, a)
}

export function js_normalize(a) {
    let out = m.vec4.create()
    return m.vec4.normalize(out, a)
}

export function js_rotateX(a, b, r) {
    let out = m.vec4.create()
    return m.vec4.rotateX(out, a, b, r)
}

export function js_rotateY(a, b, r) {
    let out = m.vec4.create()
    return m.vec4.rotateY(out, a, b, r)
}

export function js_rotateZ(a, b, r) {
    let out = m.vec4.create()
    return m.vec4.rotateZ(out, a, b, r)
}

export function js_round(a) {
    let out = m.vec4.create()
    return m.vec4.round(out, a)
}

export function js_scale(a, b) {
    let out = m.vec4.create()
    return m.vec4.scale(out, a, b)
}

export function js_scaleAndAdd(a, b, scale) {
    let out = m.vec4.create()
    return m.vec4.scaleAndAdd(out, a, b, scale)
}

export function js_squaredDistance(a, b) {
    return m.vec4.squaredDistance(a, b)
}

export function js_squaredLength(a) {
    return m.vec4.squaredLength(a)
}

export function js_str(a) {
    return m.vec4.str(a)
}

export function js_subtract(a, b) {
    let out = m.vec4.create()
    return m.vec4.subtract(out, a, b)
}

export function js_transformMat4(a, mat) {
    let out = m.vec4.create()
    return m.vec4.transformMat4(out, a, mat)
}

export function js_transformQuat(a, mat) {
    let out = m.vec4.create()
    return m.vec4.transformQuat(out, a, mat)
}

export function js_zero() {
    let out = m.vec4.create()
    return m.vec4.zero(out)
}

export function js_numbers(ar) {
    return Array.prototype.slice.call(ar)
}
