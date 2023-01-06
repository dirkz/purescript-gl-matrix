"use strict";

import * as m from "gl-matrix";

export function js_add(a, b) {
    let out = m.vec2.create()
    return m.vec2.add(out, a, b)
}

export function js_angle(a, b) {
    return m.vec2.angle(a, b)
}

export function js_ceil(a) {
    let out = m.vec2.create()
    return m.vec2.ceil(out, a)
}

export function js_cross(a, b) {
    let out = m.vec3.create()
    return m.vec2.cross(out, a, b)
}

export function js_distance(a, b) {
    return m.vec2.distance(a, b)
}

export function js_divide(a, b) {
    let out = m.vec2.create()
    return m.vec2.divide(out, a, b)
}

export function js_dot(a, b) {
    return m.vec2.dot(a, b)
}

export function js_equals(a, b) {
    return m.vec2.equals(a, b)
}

export function js_exactEquals(a, b) {
    return m.vec2.exactEquals(a, b)
}

export function js_floor(a) {
    let out = m.vec2.create()
    return m.vec2.floor(out, a)
}

export function js_fromValues(x, y) {
    return m.vec2.fromValues(x, y)
}

export function js_inverse(a) {
    let out = m.vec2.create()
    return m.vec2.inverse(out, a)
}

export function js_length(a) {
    return m.vec2.length(a)
}

export function js_lerp(a, b, t) {
    let out = m.vec2.create()
    return m.vec2.lerp(out, a, b, t)
}

export function js_max(a, b) {
    let out = m.vec2.create()
    return m.vec2.max(out, a, b)
}

export function js_min(a, b) {
    let out = m.vec2.create()
    return m.vec2.min(out, a, b)
}

export function js_multiply(a, b) {
    let out = m.vec2.create()
    return m.vec2.multiply(out, a, b)
}

export function js_negate(a) {
    let out = m.vec2.create()
    return m.vec2.negate(out, a)
}

export function js_normalize(a) {
    let out = m.vec2.create()
    return m.vec2.normalize(out, a)
}

export function js_rotate(a, b, r) {
    let out = m.vec2.create()
    return m.vec2.rotate(out, a, b, r)
}

export function js_round(a) {
    let out = m.vec2.create()
    return m.vec2.round(out, a)
}

export function js_scale(a, b) {
    let out = m.vec2.create()
    return m.vec2.scale(out, a, b)
}

export function js_scaleAndAdd(a, b, scale) {
    let out = m.vec2.create()
    return m.vec2.scaleAndAdd(out, a, b, scale)
}

export function js_squaredDistance(a, b) {
    return m.vec2.squaredDistance(a, b)
}

export function js_squaredLength(a) {
    return m.vec2.squaredLength(a)
}

export function js_str(a) {
    return m.vec2.str(a)
}

export function js_subtract(a, b) {
    let out = m.vec2.create()
    return m.vec2.subtract(out, a, b)
}

export function js_transformMat3(a, mat) {
    let out = m.vec2.create()
    return m.vec2.transformMat3(out, a, mat)
}

export function js_zero() {
    let out = m.vec2.create()
    return m.vec2.zero(out)
}

export function js_numbers(ar) {
    return Array.prototype.slice.call(ar)
}
