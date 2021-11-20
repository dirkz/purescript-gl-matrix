"use strict";

const m = require("gl-matrix")

exports.js_equals = (a, b) => {
    return m.glMatrix.equals(a, b)
}

exports.js_setMatrixArrayTypeArray = () => {
    m.glMatrix.setMatrixArrayType(Array)
}

exports.js_toRadian = (a) => {
    return m.glMatrix.toRadian(a)
}
