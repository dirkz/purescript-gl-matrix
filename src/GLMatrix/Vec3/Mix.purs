module GLMatrix.Vec3.Mix
  ( fromVec2
  , transformMat3
  , transformMat4
  , transformQuat
  ) where

import Prelude
import Data.Function.Uncurried (Fn2, runFn2)
import GLMatrix.Mat3 (Mat3)
import GLMatrix.Mat4 (Mat4)
import GLMatrix.Quat (Quat)
import GLMatrix.Vec2 as Vec2
import GLMatrix.Vec3 (Vec3)
import GLMatrix.Vec3 as Vec3
import Partial.Unsafe (unsafePartial)

fromVec2 :: Vec2.Vec2 -> Vec3.Vec3
fromVec2 v = unsafePartial $ Vec3.unsafeFromNumbers $ extendArray $ Vec2.numbers v
  where
  extendArray :: Partial => Array Number -> Array Number
  extendArray [ x, y ] = [ x, y, 0.0 ]

foreign import js_transformMat3 :: Fn2 Vec3 Mat3 Vec3

transformMat3 :: Vec3 -> Mat3 -> Vec3
transformMat3 = runFn2 js_transformMat3

foreign import js_transformMat4 :: Fn2 Vec3 Mat4 Vec3

transformMat4 :: Vec3 -> Mat4 -> Vec3
transformMat4 = runFn2 js_transformMat4

foreign import js_transformQuat :: Fn2 Vec3 Quat Vec3

transformQuat :: Vec3 -> Quat -> Vec3
transformQuat = runFn2 js_transformQuat
