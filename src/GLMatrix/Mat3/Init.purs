module GLMatrix.Mat3.Init
  ( fromVec3
  , fromMat4
  , fromScaling
  , normalFromMat4
  , projection
  ) where

import Prelude

import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import GLMatrix.Mat3 (Mat3)
import GLMatrix.Mat3 as Mat3
import GLMatrix.Mat4 (Mat4)
import GLMatrix.Vec2 (Vec2)
import GLMatrix.Vec3 (Vec3)
import GLMatrix.Vec3 as Vec3
import Partial.Unsafe (unsafePartial)

fromVec3 :: Vec3 -> Vec3 -> Vec3 -> Mat3
fromVec3 v1 v2 v3 = unsafePartial $ Mat3.unsafeFromNumbers nums
  where
  nums = Vec3.numbers v1 <> (Vec3.numbers v2) <> (Vec3.numbers v3)

foreign import js_fromMat4 :: Fn1 Mat4 Mat3

fromMat4 :: Mat4 -> Mat3
fromMat4 = runFn1 js_fromMat4

foreign import js_fromScaling :: Fn1 Vec2 Mat3

fromScaling :: Vec2 -> Mat3
fromScaling = runFn1 js_fromScaling

foreign import js_normalFromMat4 :: Fn1 Mat4 Mat3

-- |Calculates a 3x3 normal matrix (transpose inverse) from the 4x4 matrix
normalFromMat4 :: Mat4 -> Mat3
normalFromMat4 = runFn1 js_normalFromMat4

foreign import js_projection :: Fn2 Number Number Mat3

-- |Generates a 2D projection matrix with the given bounds
projection :: Number -> Number -> Mat3
projection = runFn2 js_projection
