"use strict";

const m = require("gl-matrix")

exports.js_fromMat2d = (m2) => {
    let out = m.mat2.create()
    return m.mat2.fromMat2d(out, m2)
    return out
}

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

exports.js_scale = (m3, v2) => {
    let out = m.mat3.create()
    m.mat3.scale(out, m3, v2)
    return out
}

exports.js_translate = (m3, v2) => {
    let out = m.mat3.create()
    m.mat3.translate(out, m3, v2)
    return out
}

exports.js_normalFromMat4 = (a) => {
    let out = m.mat3.create()
    m.mat3.normalFromMat4(out, a)
    return out
}
