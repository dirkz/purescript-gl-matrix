module GLMatrix.Quat.Mix where

import Data.Function.Uncurried (Fn2, Fn3, Fn1, runFn1, runFn2, runFn3)
import GLMatrix.Mat3 (Mat3)
import GLMatrix.Quat (Quat)
import GLMatrix.Vec3 (Vec3)

foreign import js_rotationTo :: Fn2 Vec3 Vec3 Quat

-- |Sets a quaternion to represent the shortest rotation from one vector to another. Both vectors are assumed to be unit length.
rotationTo :: Vec3 -> Vec3 -> Quat
rotationTo = runFn2 js_rotationTo

foreign import js_setAxes :: Fn3 Vec3 Vec3 Vec3 Quat

-- |Sets the specified quaternion with values corresponding to the given axes. Each axis is a vec3 and is expected to be unit length and perpendicular to all other specified axes.
setAxes :: Vec3 -> Vec3 -> Vec3 -> Quat
setAxes = runFn3 js_setAxes

foreign import js_fromMat3 :: Fn1 Mat3 Quat

-- |Sets the specified quaternion with values corresponding to the given axes. Each axis is a vec3 and is expected to be unit length and perpendicular to all other specified axes.
fromMat3 :: Mat3 -> Quat
fromMat3 = runFn1 js_fromMat3

foreign import js_getAxisAngle :: Fn2 Vec3 Quat Number

-- |Sets the specified quaternion with values corresponding to the given axes. Each axis is a vec3 and is expected to be unit length and perpendicular to all other specified axes.
getAxisAngle :: Vec3 -> Quat -> Number
getAxisAngle = runFn2 js_getAxisAngle

foreign import js_setAxisAngle :: Fn2 Vec3 Number Quat

-- |Sets a quat from the given angle and rotation axis, then returns it.
setAxisAngle :: Vec3 -> Number -> Quat
setAxisAngle = runFn2 js_setAxisAngle
