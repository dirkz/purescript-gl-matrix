"use strict";

const m = require("gl-matrix")

exports.js_add = (a, b) => {
    let out = m.mat4.create()
    return m.mat4.add(out, a, b)
}

exports.js_adjoint = (a) => {
    let out = m.mat4.create()
    return m.mat4.adjoint(out, a)
}

exports.js_determinant = (a) => {
    return m.mat4.determinant(a)
}

exports.js_equals = (a, b) => {
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
    return m.mat4.fromRotation(out, r, axis)
}

exports.js_fromScaling = (v) => {
    let out = m.mat4.create()
    return m.mat4.fromScaling(out, v)
}

exports.js_fromTranslation = (v) => {
    let out = m.mat4.create()
    return m.mat4.fromTranslation(out, v)
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
 
exports.js_fromXRotation = (r) => {
    let out = m.mat4.create()
    return m.mat4.fromXRotation(out, r)
}

exports.js_fromYRotation = (r) => {
    let out = m.mat4.create()
    return m.mat4.fromYRotation(out, r)
}

exports.js_fromZRotation = (r) => {
    let out = m.mat4.create()
    return m.mat4.fromZRotation(out, r)
}

exports.js_frustum = (left, right, bottom, top, near, far) => {
    let out = m.mat4.create()
    return m.mat4.frustum(out, left, right, bottom, top, near, far)
}

exports.js_identity = () => {
    return m.mat4.create()
}

exports.js_getScaling = (mat4) => {
    let out = m.vec3.create()
    return m.mat4.getScaling(out, mat4)
}

exports.js_getTranslation = (mat4) => {
    let out = m.vec3.create()
    return m.mat4.getTranslation(out, mat4)
}

exports.js_invert = (a) => {
    let out = m.mat4.create()
    return m.mat4.invert(out, a)
}

exports.js_lookAt = (eye, center, up) => {
    let out = m.mat4.create()
    return m.mat4.lookAt(out, eye, center, up)
}

exports.js_multiply = (a, b) => {
    let out = m.mat4.create()
    return m.mat4.multiply(out, a, b)
}

exports.js_multiplyScalar = (a, b) => {
    let out = m.mat4.create()
    return m.mat4.multiplyScalar(out, a, b)
}

exports.js_multiplyScalarAndAdd = (a, b, scale) => {
    let out = m.mat4.create()
    return m.mat4.multiplyScalarAndAdd(out, a, b, scale)
}

exports.js_ortho = (left, right, bottom, top, near, far) => {
    let out = m.mat4.create()
    return m.mat4.frustum(out, left, right, bottom, top, near, far)
}

exports.js_perspective = (fovy, aspect, near, far) => {
    let out = m.mat4.create()
    return m.mat4.perspective(out, fovy, aspect, near, far)
}

exports.js_perspectiveFromFieldOfView = (fov, near, far) => {
    let out = m.mat4.create()
    return m.mat4.perspectiveFromFieldOfView(out, fov, near, far)
}

exports.js_rotate = (a, r, axis) => {
    let out = m.mat4.create()
    return m.mat4.rotate(out, a, r, axis)
}

exports.js_rotateX = (a, r) => {
    let out = m.mat4.create()
    return m.mat4.rotateX(out, a, r)
}

exports.js_rotateY = (a, r) => {
    let out = m.mat4.create()
    return m.mat4.rotateY(out, a, r)
}

exports.js_rotateZ = (a, r) => {
    let out = m.mat4.create()
    return m.mat4.rotateZ(out, a, r)
}

exports.js_scale = (mat4, v) => {
    let out = m.mat4.create()
    return m.mat4.scale(out, mat4, v)
}

exports.js_str = (a) => {
    return m.mat4.str(a)
}

exports.js_subtract = (a, b) => {
    let out = m.mat4.create()
    return m.mat4.subtract(out, a, b)
}

exports.js_targetTo = (eye, center, up) => {
    let out = m.mat4.create()
    return m.mat4.targetTo(out, eye, center, up)
}

exports.js_translate = (a, v) => {
    let out = m.mat4.create()
    return m.mat4.translate(out, a, v)
}

exports.js_transpose = (a) => {
    let out = m.mat4.create()
    return m.mat4.transpose(out, a)
}

exports.js_numbers = (ar) => {
    return Array.prototype.slice.call(ar)
}
