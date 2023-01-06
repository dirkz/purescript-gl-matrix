"use strict";

import m from "gl-matrix";

export function js_equals(a, b) {
    return m.quat.equals(a, b)
}

export function js_exactEquals(a, b) {
    return m.quat.exactEquals(a, b)
}

export function js_length(a) {
    return m.quat.length(a)
}

export function js_sqlerp(a, b, c, d, t) {
    let out = m.quat.create()
    return m.quat.sqlerp(out, a, b, c, d, t)
}

export function js_add(a, b) {
    let out = m.quat.create()
    return m.quat.add(out, a, b)
}

export function js_calculateW(a) {
    let out = m.quat.create()
    return m.quat.calculateW(out, a)
}

export function js_conjugate(a) {
    let out = m.quat.create()
    return m.quat.conjugate(out, a)
}

export function js_dot(a, b) {
    let out = m.quat.create()
    return m.quat.dot(out, a, b)
}

export function js_exp(a) {
    let out = m.quat.create()
    return m.quat.exp(out, a)
}

export function js_fromEuler(x, y, z) {
    let out = m.quat.create()
    return m.quat.fromEuler(out, x, y, z)
}

export function js_fromValues(x, y, z, w) {
    return m.quat.fromValues(x, y, z, w)
}

export function js_getAngle(a, b) {
    return m.quat.getAngle(a, b)
}

export function js_identity() {
    let out = m.quat.create()
    return m.quat.identity(out)
}

export function js_invert(a) {
    let out = m.quat.create()
    return m.quat.invert(out, a)
}

export function js_lerp(a, b, t) {
    let out = m.quat.create()
    return m.quat.lerp(out, a, b, t)
}

export function js_ln(a) {
    let out = m.quat.create()
    return m.quat.ln(out, a)
}

export function js_multiply(a, b) {
    let out = m.quat.create()
    return m.quat.multiply(out, a, b)
}

export function js_normalize(a) {
    let out = m.quat.create()
    return m.quat.normalize(out, a)
}

export function js_pow(a, b) {
    let out = m.quat.create()
    return m.quat.pow(out, a, b)
}

export function js_rotateX(a, r) {
    let out = m.quat.create()
    return m.quat.rotateX(out, a, r)
}

export function js_rotateY(a, r) {
    let out = m.quat.create()
    return m.quat.rotateY(out, a, r)
}

export function js_rotateZ(a, r) {
    let out = m.quat.create()
    return m.quat.rotateZ(out, a, r)
}

export function js_scale(a, s) {
    let out = m.quat.create()
    return m.quat.scale(out, a, s)
}

export function js_slerp(a, b, t) {
    let out = m.quat.create()
    return m.quat.slerp(out, a, b, t)
}

export function js_squaredLength(a) {
    return m.quat.squaredLength(a)
}

export function js_str(a) {
    return m.quat.str(a)
}

export function js_numbers(ar) {
    return Array.prototype.slice.call(ar)
}
