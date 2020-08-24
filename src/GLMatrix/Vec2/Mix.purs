module GLMatrix.Vec2.Mix where

import Data.Function.Uncurried (Fn2, runFn2)
import GLMatrix.Mat2 (Mat2)
import GLMatrix.Vec2 (Vec2)

foreign import js_transformMat2 :: Fn2 Vec2 Mat2 Vec2

-- |Transforms the vec2 with a mat2
transformMat2 :: Vec2 -> Mat2 -> Vec2
transformMat2 = runFn2 js_transformMat2
