"use strict";

import m from "gl-matrix";

export function js_equals(a, b) {
    return m.glMatrix.equals(a, b)
}

export function js_setMatrixArrayTypeArray() {
    m.glMatrix.setMatrixArrayType(Array)
}

export function js_setMatrixArrayTypeFloat32Array() {
    m.glMatrix.setMatrixArrayType(Float32Array)
}

export function js_toRadian(a) {
    return m.glMatrix.toRadian(a)
}
