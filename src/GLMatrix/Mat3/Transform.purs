module GLMatrix.Mat3.Transform
  ( scale
  , translate
  ) where

import Data.Function.Uncurried (Fn2, runFn2)
import GLMatrix.Mat3 (Mat3)
import GLMatrix.Vec2 (Vec2)

foreign import js_scale :: Fn2 Mat3 Vec2 Mat3

-- |Scales the mat3 by the dimensions in the given vec2
scale :: Mat3 -> Vec2 -> Mat3
scale = runFn2 js_scale

foreign import js_translate :: Fn2 Mat3 Vec2 Mat3

-- |Translate a mat3 by the given vector
translate :: Mat3 -> Vec2 -> Mat3
translate = runFn2 js_translate
