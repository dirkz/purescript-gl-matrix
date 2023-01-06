"use strict";

import m from "gl-matrix";

export function js_add(a, b) {
    let out = m.mat4.create()
    return m.mat4.add(out, a, b)
}

export function js_adjoint(a) {
    let out = m.mat4.create()
    return m.mat4.adjoint(out, a)
}

export function js_determinant(a) {
    return m.mat4.determinant(a)
}

export function js_equals(a, b) {
    return m.mat4.equals(a, b)
}

export function js_exactEquals(a, b) {
    return m.mat4.exactEquals(a, b)
}

export function js_frob(a) {
    return m.mat4.frob(a)
}

export function js_fromRotation(r, axis) {
    let out = m.mat4.create()
    return m.mat4.fromRotation(out, r, axis)
}

export function js_fromScaling(v) {
    let out = m.mat4.create()
    return m.mat4.fromScaling(out, v)
}

export function js_fromTranslation(v) {
    let out = m.mat4.create()
    return m.mat4.fromTranslation(out, v)
}

export function js_fromValues(m00) {
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
}

export function js_fromXRotation(r) {
    let out = m.mat4.create()
    return m.mat4.fromXRotation(out, r)
}

export function js_fromYRotation(r) {
    let out = m.mat4.create()
    return m.mat4.fromYRotation(out, r)
}

export function js_fromZRotation(r) {
    let out = m.mat4.create()
    return m.mat4.fromZRotation(out, r)
}

export function js_frustum(left, right, bottom, top, near, far) {
    let out = m.mat4.create()
    return m.mat4.frustum(out, left, right, bottom, top, near, far)
}

export function js_identity() {
    return m.mat4.create()
}

export function js_getScaling(mat4) {
    let out = m.vec3.create()
    return m.mat4.getScaling(out, mat4)
}

export function js_getTranslation(mat4) {
    let out = m.vec3.create()
    return m.mat4.getTranslation(out, mat4)
}

export function js_invert(a) {
    let out = m.mat4.create()
    return m.mat4.invert(out, a)
}

export function js_lookAt(eye, center, up) {
    let out = m.mat4.create()
    return m.mat4.lookAt(out, eye, center, up)
}

export function js_multiply(a, b) {
    let out = m.mat4.create()
    return m.mat4.multiply(out, a, b)
}

export function js_multiplyScalar(a, b) {
    let out = m.mat4.create()
    return m.mat4.multiplyScalar(out, a, b)
}

export function js_multiplyScalarAndAdd(a, b, scale) {
    let out = m.mat4.create()
    return m.mat4.multiplyScalarAndAdd(out, a, b, scale)
}

export function js_ortho(left, right, bottom, top, near, far) {
    let out = m.mat4.create()
    return m.mat4.frustum(out, left, right, bottom, top, near, far)
}

export function js_perspective(fovy, aspect, near, far) {
    let out = m.mat4.create()
    return m.mat4.perspective(out, fovy, aspect, near, far)
}

export function js_perspectiveFromFieldOfView(fov, near, far) {
    let out = m.mat4.create()
    return m.mat4.perspectiveFromFieldOfView(out, fov, near, far)
}

export function js_rotate(a, r, axis) {
    let out = m.mat4.create()
    return m.mat4.rotate(out, a, r, axis)
}

export function js_rotateX(a, r) {
    let out = m.mat4.create()
    return m.mat4.rotateX(out, a, r)
}

export function js_rotateY(a, r) {
    let out = m.mat4.create()
    return m.mat4.rotateY(out, a, r)
}

export function js_rotateZ(a, r) {
    let out = m.mat4.create()
    return m.mat4.rotateZ(out, a, r)
}

export function js_scale(mat4, v) {
    let out = m.mat4.create()
    return m.mat4.scale(out, mat4, v)
}

export function js_str(a) {
    return m.mat4.str(a)
}

export function js_subtract(a, b) {
    let out = m.mat4.create()
    return m.mat4.subtract(out, a, b)
}

export function js_targetTo(eye, center, up) {
    let out = m.mat4.create()
    return m.mat4.targetTo(out, eye, center, up)
}

export function js_translate(a, v) {
    let out = m.mat4.create()
    return m.mat4.translate(out, a, v)
}

export function js_transpose(a) {
    let out = m.mat4.create()
    return m.mat4.transpose(out, a)
}

export function js_numbers(ar) {
    return Array.prototype.slice.call(ar)
}
