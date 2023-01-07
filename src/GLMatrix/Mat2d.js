"use strict";

import * as m from "gl-matrix";

export function js_add(a, b) {
    let out = m.mat2d.create()
    return m.mat2d.add(out, a, b)
}

export function js_determinant(a) {
    return m.mat2d.determinant(a)
}

export function js_equals(a, b) {
    return m.mat2d.equals(a, b)
}

export function js_exactEquals(a, b) {
    return m.mat2d.exactEquals(a, b)
}

export function js_frob(a) {
    return m.mat2d.frob(a)
}

export function js_fromRotation(r) {
    let out = m.mat2d.create()
    return m.mat2d.fromRotation(out, r)
}

export function js_fromValues(a, b, c, d, tx, ty) {
    return m.mat2d.fromValues(a, b, c, d, tx, ty)
}

export function js_identity() {
    return m.mat2d.create()
}

export function js_invert(a) {
    let out = m.mat2d.create()
    return m.mat2d.invert(out, a)
}

export function js_multiply(a, b) {
    let out = m.mat2d.create()
    return m.mat2d.multiply(out, a, b)
}

export function js_multiplyScalar(a, b) {
    let out = m.mat2d.create()
    return m.mat2d.multiplyScalar(out, a, b)
}

export function js_multiplyScalarAndAdd(a, b, scale) {
    let out = m.mat2d.create()
    return m.mat2d.multiplyScalarAndAdd(out, a, b, scale)
}

export function js_rotate(a, r) {
    let out = m.mat2d.create()
    return m.mat2d.rotate(out, a, r)
}

export function js_str(a) {
    return m.mat2d.str(a)
}

export function js_subtract(a, b) {
    let out = m.mat2d.create()
    return m.mat2d.subtract(out, a, b)
}

export function js_numbers(ar) {
    return Array.prototype.slice.call(ar)
}
