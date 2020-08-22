"use strict";

const m = require("gl-matrix")

exports.js_fromMat4 = (mat) => {
    let out = m.mat3.create()
    m.mat3.fromMat4(out, mat)
    return out
}

exports.js_fromScaling = (v2) => {
    let out = m.mat3.create()
    m.mat3.fromScaling(out, v2)
    return out
}

exports.js_fromTranslation = (v2) => {
    let out = m.mat3.create()
    m.mat3.fromTranslation(out, v2)
    return out
}

exports.js_normalFromMat4 = (m4) => {
    let out = m.mat3.create()
    m.mat3.normalFromMat4(out, m4)
    return out
}
