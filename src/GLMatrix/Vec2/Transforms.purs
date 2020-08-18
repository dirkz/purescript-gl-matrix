module GLMatrix.Vec2.Transforms where

import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import GLMatrix.Mat2 (Mat2)
import GLMatrix.Vec2 (Vec2)

foreign import js_transformMat2 :: Fn2 Vec2 Mat2 Vec2

-- |Transforms the vec2 with a mat2
transformMat2 :: Vec2 -> Mat2 -> Vec2
transformMat2 = runFn2 js_transformMat2

foreign import js_fromScaling :: Fn1 Vec2 Mat2

-- |Creates a matrix from a vector scaling This is equivalent to (but much faster than): mat2.identity(dest); mat2.scale(dest, dest, vec);
fromScaling :: Vec2 -> Mat2
fromScaling = runFn1 js_fromScaling
