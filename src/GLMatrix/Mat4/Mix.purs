module GLMatrix.Mat4.Mix
  ( fromQuat
  , fromVec4
  , fromRotationTranslation
  ) where

import Prelude

import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import GLMatrix.Mat4 (Mat4, unsafeFromNumbers)
import GLMatrix.Quat (Quat)
import GLMatrix.Vec3 (Vec3)
import GLMatrix.Vec4 (Vec4)
import GLMatrix.Vec4 as Vec4
import Partial.Unsafe (unsafePartial)

fromVec4 :: Vec4 -> Vec4 -> Vec4 -> Vec4 -> Mat4
fromVec4 v1 v2 v3 v4 = unsafePartial $ unsafeFromNumbers nums
  where
  nums = Vec4.numbers v1 <> (Vec4.numbers v2) <> (Vec4.numbers v3) <> (Vec4.numbers v4)

foreign import js_fromQuat :: Fn1 Quat Mat4

-- |Calculates a 4x4 matrix from the given quaternion
fromQuat :: Quat -> Mat4
fromQuat = runFn1 js_fromQuat

foreign import js_fromRotationTranslation :: Fn2 Quat Vec3 Mat4

-- |Creates a matrix from a quaternion rotation and vector translation This is equivalent to (but much faster than): mat4.identity(dest); mat4.translate(dest, vec); let quatMat = mat4.create(); quat4.toMat4(quat, quatMat); mat4.multiply(dest, quatMat);
fromRotationTranslation :: Quat -> Vec3 -> Mat4
fromRotationTranslation = runFn2 js_fromRotationTranslation
