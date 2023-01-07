"use strict";

import * as m from "gl-matrix";

export function js_add(a, b) {
    let out = m.mat2.create()
    return m.mat2.add(out, a, b)
}

export function js_adjoint(a) {
    let out = m.mat2.create()
    return m.mat2.adjoint(out, a)
}

export function js_determinant(a) {
    return m.mat2.determinant(a)
}

export function js_equals(a, b) {
    return m.mat2.equals(a, b)
}

export function js_exactEquals(a, b) {
    return m.mat2.exactEquals(a, b)
}

export function js_frob(a) {
    return m.mat2.frob(a)
}

export function js_fromRotation(r) {
    let out = m.mat2.create()
    return m.mat2.fromRotation(out, r)
}

export function js_fromValues(m00, m01, m10, m11) {
    return m.mat2.fromValues(m00, m01, m10, m11)
}

export function js_identity() {
    return m.mat2.create()
}

export function js_invert(a) {
    let out = m.mat2.create()
    return m.mat2.invert(out, a)
}

export function js_ldu(a) {
    let l = m.mat2.create()
    let d = m.mat2.create()
    let u = m.mat2.create()
    return m.mat2.LDU(l, d, u, a)
}

export function js_multiply(a, b) {
    let out = m.mat2.create()
    return m.mat2.multiply(out, a, b)
}

export function js_multiplyScalar(a, b) {
    let out = m.mat2.create()
    return m.mat2.multiplyScalar(out, a, b)
}

export function js_multiplyScalarAndAdd(a, b, scale) {
    let out = m.mat2.create()
    return m.mat2.multiplyScalarAndAdd(out, a, b, scale)
}

export function js_rotate(a, r) {
    let out = m.mat2.create()
    return m.mat2.rotate(out, a, r)
}

export function js_str(a) {
    return m.mat2.str(a)
}

export function js_subtract(a, b) {
    let out = m.mat2.create()
    return m.mat2.subtract(out, a, b)
}

export function js_transpose(a) {
    let out = m.mat2.create()
    return m.mat2.transpose(out, a)
}

export function js_numbers(ar) {
    return Array.prototype.slice.call(ar)
}
