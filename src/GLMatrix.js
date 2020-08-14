"use strict";

const glMatrix = require("gl-matrix")

exports.js_equals = (a, b) => {
    return glMatrix.equals(a, b)
}

exports.js_setMatrixArrayTypeArray = () => {
    glMatrix.setMatrixType(Array)
}

exports.js_setMatrixArrayTypeFloat32Array = () => {
    glMatrix.setMatrixType(Float32Array)
}

exports.js_toRadian = (a) => {
    return glMatrix.toRadian(a)
}