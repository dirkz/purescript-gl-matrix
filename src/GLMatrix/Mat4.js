"use strict";

const m = require("gl-matrix")

exports.js_add = (a, b) => {
    let out = m.mat4.create()
    m.mat4.add(out, a, b)
    return out
}

exports.js_adjoint = (a) => {
    let out = m.mat4.create()
    m.mat4.adjoint(out, a)
    return out
}

exports.js_determinant = (a) => {
    return m.mat4.determinant(a)
}

exports.js_epsilonEquals = (a, b) => {
    return m.mat4.equals(a, b)
}

exports.js_exactEquals = (a, b) => {
    return m.mat4.exactEquals(a, b)
}

exports.js_frob = (a) => {
    return m.mat4.frob(a)
}

exports.js_fromRotation = (r, axis) => {
    let out = m.mat4.create()
    m.mat4.fromRotation(out, r, axis)
    return out
}

exports.js_fromValues = function (m00) {
    return function (m01) {
        return function (m02) {
            return function (m03) {
                return function (m10) {
                    return function (m11) {
                        return function (m12) {
                            return function (m13) {
                                return function (m20) { 
                                    return function (m21) {
                                        return function (m22) {
                                            return function (m23) {
                                                return function (m30) {
                                                    return function (m31) {
                                                        return function (m32) {
                                                            return function (m33) {
                                                                return m.mat4.fromValues(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};
  
exports.js_identity = () => {
    return m.mat4.create()
}

exports.js_invert = (a) => {
    let out = m.mat4.create()
    m.mat4.invert(out, a)
    return out
}

exports.js_ldu = (a) => {
    let l = m.mat4.create()
    let d = m.mat4.create()
    let u = m.mat4.create()
    return m.mat4.LDU(l, d, u, a)
}

exports.js_multiply = (a, b) => {
    let out = m.mat4.create()
    m.mat4.multiply(out, a, b)
    return out
}

exports.js_multiplyScalar = (a, b) => {
    let out = m.mat4.create()
    m.mat4.multiplyScalar(out, a, b)
    return out
}

exports.js_multiplyScalarAndAdd = (a, b, scale) => {
    let out = m.mat4.create()
    m.mat4.multiplyScalarAndAdd(out, a, b, scale)
    return out
}

exports.js_rotate = (a, r) => {
    let out = m.mat4.create()
    m.mat4.rotate(out, a, r)
    return out
}

exports.js_str = (a) => {
    return m.mat4.str(a)
}

exports.js_subtract = (a, b) => {
    let out = m.mat4.create()
    m.mat4.subtract(out, a, b)
    return out
}

exports.js_transpose = (a) => {
    let out = m.mat4.create()
    m.mat4.transpose(out, a)
    return out
}

exports.js_numbers = (ar) => {
    return Array.prototype.slice.call(ar)
}
