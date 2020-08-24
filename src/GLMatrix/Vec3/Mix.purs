module GLMatrix.Vec3.Mix where

import Prelude
import GLMatrix.Vec2 as Vec2
import GLMatrix.Vec3 as Vec3
import Partial.Unsafe (unsafePartial)

fromVec2 :: Vec2.Vec2 -> Vec3.Vec3
fromVec2 v = unsafePartial $ Vec3.unsafeFromNumbers $ extendArray $ Vec2.numbers v
  where
  extendArray :: Partial => Array Number -> Array Number
  extendArray [ x, y ] = [ x, y, 0.0 ]
