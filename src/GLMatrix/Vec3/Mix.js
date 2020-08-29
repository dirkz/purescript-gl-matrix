"use strict";

const m = require("gl-matrix")

exports.js_transformMat3 = (a, mat) => {
    let out = m.vec3.create()
    return m.vec3.transformMat3(out, a, mat)
}

exports.js_transformMat4 = (a, mat) => {
    let out = m.vec3.create()
    return m.vec3.transformMat4(out, a, mat)
}

exports.js_transformQuat = (a, q) => {
    let out = m.vec3.create()
    return m.vec3.transformQuat(out, a, q)
}
