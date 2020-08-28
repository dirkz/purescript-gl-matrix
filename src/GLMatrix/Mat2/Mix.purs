module GLMatrix.Mat2.Mix where

import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import GLMatrix.Mat2 (Mat2)
import GLMatrix.Mat2d (Mat2d)
import GLMatrix.Vec2 (Vec2)

foreign import js_fromMat2d :: Fn1 Mat2d Mat2

-- |Copies the values from a mat2d into a mat3
fromMat2d :: Mat2d -> Mat2
fromMat2d = runFn1 js_fromMat2d

foreign import js_fromScaling :: Fn1 Vec2 Mat2

-- |Creates a matrix from a vector scaling This is equivalent to (but much faster than): mat2.identity(dest); mat2.scale(dest, dest, vec);
fromScaling :: Vec2 -> Mat2
fromScaling = runFn1 js_fromScaling

foreign import js_scale :: Fn2 Mat2 Vec2 Mat2

-- |Scales the mat2 by the dimensions in the given vec2
scale :: Mat2 -> Vec2 -> Mat2
scale = runFn2 js_scale
