module GLMatrix.Mat4.Mix
  ( fromVec4
  ) where

import Prelude
import GLMatrix.Mat4 (Mat4, unsafeFromNumbers)
import GLMatrix.Vec4 (Vec4)
import GLMatrix.Vec4 as Vec4
import Partial.Unsafe (unsafePartial)

fromVec4 :: Vec4 -> Vec4 -> Vec4 -> Vec4 -> Mat4
fromVec4 v1 v2 v3 v4 = unsafePartial $ unsafeFromNumbers nums
  where
  nums = Vec4.numbers v1 <> (Vec4.numbers v2) <> (Vec4.numbers v3) <> (Vec4.numbers v4)
