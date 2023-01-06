"use strict";

import * as m from "gl-matrix";

export function js_transformMat3(a, mat) {
    let out = m.vec3.create()
    return m.vec3.transformMat3(out, a, mat)
}

export function js_transformMat4(a, mat) {
    let out = m.vec3.create()
    return m.vec3.transformMat4(out, a, mat)
}

export function js_transformQuat(a, q) {
    let out = m.vec3.create()
    return m.vec3.transformQuat(out, a, q)
}
