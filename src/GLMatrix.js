"use strict";

const m = require("gl-matrix")

exports.js_equals = (a, b) => {
    return m.glMatrix.equals(a, b)
}

exports.js_setMatrixArrayTypeArray = () => {
    m.glMatrix.setMatrixType(Array)
}

exports.js_setMatrixArrayTypeFloat32Array = () => {
    m.glMatrix.setMatrixType(Float32Array)
}

exports.js_toRadian = (a) => {
    return m.glMatrix.toRadian(a)
}