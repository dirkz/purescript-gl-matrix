"use strict";

import * as m from "gl-matrix";

export function js_add(a, b) {
    let out = m.vec3.create()
    return m.vec3.add(out, a, b)
}

export function js_angle(a, b) {
    return m.vec3.angle(a, b)
}

export function js_ceil(a) {
    let out = m.vec3.create()
    return m.vec3.ceil(out, a)
}

export function js_cross(a, b) {
    let out = m.vec3.create()
    return m.vec3.cross(out, a, b)
}

export function js_distance(a, b) {
    return m.vec3.distance(a, b)
}

export function js_divide(a, b) {
    let out = m.vec3.create()
    return m.vec3.divide(out, a, b)
}

export function js_dot(a, b) {
    return m.vec3.dot(a, b)
}

export function js_equals(a, b) {
    return m.vec3.equals(a, b)
}

export function js_exactEquals(a, b) {
    return m.vec3.exactEquals(a, b)
}

export function js_floor(a) {
    let out = m.vec3.create()
    return m.vec3.floor(out, a)
}

export function js_fromValues(x, y, z) {
    return m.vec3.fromValues(x, y, z)
}

export function js_inverse(a) {
    let out = m.vec3.create()
    return m.vec3.inverse(out, a)
}

export function js_length(a) {
    return m.vec3.length(a)
}

export function js_lerp(a, b, t) {
    let out = m.vec3.create()
    return m.vec3.lerp(out, a, b, t)
}

export function js_max(a, b) {
    let out = m.vec3.create()
    return m.vec3.max(out, a, b)
}

export function js_min(a, b) {
    let out = m.vec3.create()
    return m.vec3.min(out, a, b)
}

export function js_multiply(a, b) {
    let out = m.vec3.create()
    return m.vec3.multiply(out, a, b)
}

export function js_negate(a) {
    let out = m.vec3.create()
    return m.vec3.negate(out, a)
}

export function js_normalize(a) {
    let out = m.vec3.create()
    return m.vec3.normalize(out, a)
}

export function js_rotateX(a, b, r) {
    let out = m.vec3.create()
    return m.vec3.rotateX(out, a, b, r)
}

export function js_rotateY(a, b, r) {
    let out = m.vec3.create()
    return m.vec3.rotateY(out, a, b, r)
}

export function js_rotateZ(a, b, r) {
    let out = m.vec3.create()
    return m.vec3.rotateZ(out, a, b, r)
}

export function js_round(a) {
    let out = m.vec3.create()
    return m.vec3.round(out, a)
}

export function js_scale(a, b) {
    let out = m.vec3.create()
    return m.vec3.scale(out, a, b)
}

export function js_scaleAndAdd(a, b, scale) {
    let out = m.vec3.create()
    return m.vec3.scaleAndAdd(out, a, b, scale)
}

export function js_squaredDistance(a, b) {
    return m.vec3.squaredDistance(a, b)
}

export function js_squaredLength(a) {
    return m.vec3.squaredLength(a)
}

export function js_str(a) {
    return m.vec3.str(a)
}

export function js_subtract(a, b) {
    let out = m.vec3.create()
    return m.vec3.subtract(out, a, b)
}

export function js_zero() {
    let out = m.vec3.create()
    return m.vec3.zero(out)
}

export function js_numbers(ar) {
    return Array.prototype.slice.call(ar)
}

export function js_bezier(a, b, c, d, t) {
    let out = m.vec3.create()
    return m.vec3.bezier(out, a, b, c, d, t)
}

export function js_hermite(a, b, c, d, t) {
    let out = m.vec3.create()
    return m.vec3.hermite(out, a, b, c, d, t)
}
