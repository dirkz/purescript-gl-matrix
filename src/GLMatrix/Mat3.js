"use strict";

import * as m from "gl-matrix";

export function js_add(a, b) {
    let out = m.mat3.create()
    return m.mat3.add(out, a, b)
}

export function js_adjoint(a) {
    let out = m.mat3.create()
    return m.mat3.adjoint(out, a)
}

export function js_determinant(a) {
    return m.mat3.determinant(a)
}

export function js_equals(a, b) {
    return m.mat3.equals(a, b)
}

export function js_exactEquals(a, b) {
    return m.mat3.exactEquals(a, b)
}

export function js_frob(a) {
    return m.mat3.frob(a)
}

export function js_fromRotation(r) {
    let out = m.mat3.create()
    return m.mat3.fromRotation(out, r)
}

export function js_fromValues(m00, m01, m02, m10, m11, m12, m20, m21, m22) {
    return m.mat3.fromValues(m00, m01, m02, m10, m11, m12, m20, m21, m22)
}

export function js_identity() {
    return m.mat3.create()
}

export function js_invert(a) {
    let out = m.mat3.create()
    return m.mat3.invert(out, a)
}

export function js_multiply(a, b) {
    let out = m.mat3.create()
    return m.mat3.multiply(out, a, b)
}

export function js_multiplyScalar(a, b) {
    let out = m.mat3.create()
    return m.mat3.multiplyScalar(out, a, b)
}

export function js_multiplyScalarAndAdd(a, b, scale) {
    let out = m.mat3.create()
    return m.mat3.multiplyScalarAndAdd(out, a, b, scale)
}

export function js_projection(w, h) {
    let out = m.mat3.create()
    return m.mat3.projection(out, w, h)
}

export function js_rotate(a, r) {
    let out = m.mat3.create()
    return m.mat3.rotate(out, a, r)
}

export function js_str(a) {
    return m.mat3.str(a)
}

export function js_subtract(a, b) {
    let out = m.mat3.create()
    return m.mat3.subtract(out, a, b)
}

export function js_transpose(a) {
    let out = m.mat3.create()
    return m.mat3.transpose(out, a)
}

export function js_numbers(ar) {
    return Array.prototype.slice.call(ar)
}
