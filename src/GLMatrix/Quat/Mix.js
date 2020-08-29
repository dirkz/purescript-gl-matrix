"use strict";

const m = require("gl-matrix")

exports.js_rotationTo = (a, b) => {
    let out = m.quat.create()
    return m.quat.rotationTo(out, a, b)
}

exports.js_setAxes = (view, right, up) => {
    let out = m.quat.create()
    return m.quat.setAxes(out, view, right, up)
}

exports.js_fromMat3 = (mat3) => {
    let out = m.quat.create()
    return m.quat.fromMat3(out, mat3)
}

exports.js_getAxisAngle = (v3, a) => {
    return m.quat.getAxisAngle(v3, a)
}

exports.js_setAxisAngle = (v3, a) => {
    let out = m.quat.create()
    return m.quat.setAxisAngle(out, v3, a)
}
