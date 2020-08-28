module GLMatrix.Mat3.Mix
  ( fromVec3
  , fromMat2d
  , fromMat4
  , fromScaling
  , fromTranslation
  , normalFromMat4
  , scale
  , translate
  ) where

import Prelude

import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import GLMatrix.Mat2d (Mat2d)
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

foreign import js_fromMat2d :: Fn1 Mat2d Mat3

-- |Copies the values from a mat2d into a mat3
fromMat2d :: Mat2d -> Mat3
fromMat2d = runFn1 js_fromMat2d

foreign import js_fromMat4 :: Fn1 Mat4 Mat3

fromMat4 :: Mat4 -> Mat3
fromMat4 = runFn1 js_fromMat4

foreign import js_fromScaling :: Fn1 Vec2 Mat3

fromScaling :: Vec2 -> Mat3
fromScaling = runFn1 js_fromScaling

foreign import js_fromTranslation :: Fn1 Vec2 Mat3

-- |Creates a matrix from a vector translation This is equivalent to (but much faster than): mat3.identity(dest); mat3.translate(dest, dest, vec);
fromTranslation :: Vec2 -> Mat3
fromTranslation = runFn1 js_fromTranslation

foreign import js_normalFromMat4 :: Fn1 Mat4 Mat3

-- |Calculates a 3x3 normal matrix (transpose inverse) from the 4x4 matrix
normalFromMat4 :: Mat4 -> Mat3
normalFromMat4 = runFn1 js_normalFromMat4

foreign import js_scale :: Fn2 Mat3 Vec2 Mat3

-- |Scales the mat3 by the dimensions in the given vec2
scale :: Mat3 -> Vec2 -> Mat3
scale = runFn2 js_scale

foreign import js_translate :: Fn2 Mat3 Vec2 Mat3

-- |Translate a mat3 by the given vector
translate :: Mat3 -> Vec2 -> Mat3
translate = runFn2 js_translate
