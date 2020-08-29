module GLMatrix.Mat4.Mix
  ( fromVec4
  ) where

import Prelude

import Data.Function.Uncurried (Fn1, runFn1)
import GLMatrix.Mat4 (Mat4, unsafeFromNumbers)
import GLMatrix.Quat (Quat)
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

