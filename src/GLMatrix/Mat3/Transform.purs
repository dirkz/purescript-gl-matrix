module GLMatrix.Mat3.Transform
  ( normalFromMat4
  , scale
  , translate
  ) where

import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import GLMatrix.Mat3 (Mat3)
import GLMatrix.Mat4 (Mat4)
import GLMatrix.Vec2 (Vec2)

foreign import js_scale :: Fn2 Mat3 Vec2 Mat3

-- |Scales the mat3 by the dimensions in the given vec2
scale :: Mat3 -> Vec2 -> Mat3
scale = runFn2 js_scale

foreign import js_translate :: Fn2 Mat3 Vec2 Mat3

-- |Translate a mat3 by the given vector
translate :: Mat3 -> Vec2 -> Mat3
translate = runFn2 js_translate

foreign import js_normalFromMat4 :: Fn1 Mat4 Mat3

-- |Calculates a 3x3 normal matrix (transpose inverse) from the 4x4 matrix
normalFromMat4 :: Mat4 -> Mat3
normalFromMat4 = runFn1 js_normalFromMat4
