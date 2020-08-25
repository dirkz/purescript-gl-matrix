module GLMatrix.Quat.Mix where

import Data.Function.Uncurried (Fn2, Fn3, Fn4, runFn2, runFn3, runFn4)
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

foreign import js_sqlerp :: Fn4 Number Number Number Number Quat

-- |Sets the specified quaternion with values corresponding to the given axes. Each axis is a vec3 and is expected to be unit length and perpendicular to all other specified axes.
sqlerp :: Number -> Number -> Number -> Number -> Quat
sqlerp = runFn4 js_sqlerp
