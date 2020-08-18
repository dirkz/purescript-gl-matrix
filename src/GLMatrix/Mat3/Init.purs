module GLMatrix.Mat3.Init where

import Prelude
import GLMatrix.Mat3 (Mat3)
import GLMatrix.Mat3 as Mat3
import GLMatrix.Vec3 (Vec3)
import GLMatrix.Vec3 as Vec3
import Partial.Unsafe (unsafePartial)

fromVec3 :: Vec3 -> Vec3 -> Vec3 -> Mat3
fromVec3 v1 v2 v3 = unsafePartial $ Mat3.unsafeFromNumbers nums
  where
  nums = Vec3.numbers v1 <> (Vec3.numbers v2) <> (Vec3.numbers v3)
