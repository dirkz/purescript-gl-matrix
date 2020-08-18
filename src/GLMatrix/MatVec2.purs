module GLMatrix.MatVec2 where

import Data.Function.Uncurried (Fn2, runFn2)
import GLMatrix.Mat2 (Mat2)
import GLMatrix.Vec2 (Vec2)

foreign import js_scale :: Fn2 Mat2 Vec2 Mat2

-- |Scales the mat2 by the dimensions in the given vec2
scale :: Mat2 -> Vec2 -> Mat2
scale = runFn2 js_scale
