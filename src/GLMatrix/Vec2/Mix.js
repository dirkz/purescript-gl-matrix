"use strict";

const m = require("gl-matrix")

exports.js_transformMat2 = (a, mat) => {
    let out = m.vec2.create()
    return m.vec2.transformMat2(out, a, mat)
}

exports.js_transformMat2d = (a, mat) => {
    let out = m.vec2.create()
    return m.vec2.transformMat2d(out, a, mat)
}

exports.js_transformMat3 = (a, mat) => {
    let out = m.vec2.create()
    return m.vec2.transformMat3(out, a, mat)
}

exports.js_transformMat4 = (a, mat) => {
    let out = m.vec2.create()
    return m.vec2.transformMat4(out, a, mat)
}
