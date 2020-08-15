"use strict";

const m = require("gl-matrix")

exports.js_epsilonEquals = (a, b) => {
    return m.glMatrix.equals(a, b)
}

exports.js_setMatrixArrayTypeToArray = () => {
    m.glMatrix.setMatrixArrayType(Array)
}

exports.js_toRadian = (a) => {
    return m.glMatrix.toRadian(a)
}