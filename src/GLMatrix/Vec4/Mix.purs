module GLMatrix.Vec4.Mix (fromVec3) where

import Prelude
import GLMatrix.Vec3 (Vec3)
import GLMatrix.Vec3 as Vec3
import GLMatrix.Vec4 (Vec4, unsafeFromNumbers)
import Partial.Unsafe (unsafePartial)

fromVec3 :: Vec3 -> Vec4
fromVec3 v = unsafePartial $ unsafeFromNumbers $ extendArray $ Vec3.numbers v
  where
  extendArray :: Partial => Array Number -> Array Number
  extendArray [ x, y, z ] = [ x, y, z, 0.0 ]
