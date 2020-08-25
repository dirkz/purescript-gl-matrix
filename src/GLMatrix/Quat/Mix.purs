module GLMatrix.Quat.Mix where

import Data.Function.Uncurried (Fn2, runFn2)
import GLMatrix.Quat (Quat)
import GLMatrix.Vec3 (Vec3)

foreign import js_rotationTo :: Fn2 Vec3 Vec3 Quat

-- |Sets a quaternion to represent the shortest rotation from one vector to another. Both vectors are assumed to be unit length.
rotationTo :: Vec3 -> Vec3 -> Quat
rotationTo = runFn2 js_rotationTo
