"use strict";

const m = require("gl-matrix")

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
