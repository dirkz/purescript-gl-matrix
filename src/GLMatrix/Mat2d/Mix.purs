module GLMatrix.Mat2d.Mix where

import Prelude
import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import GLMatrix.Mat2d (Mat2d, unsafeFromNumbers)
import GLMatrix.Vec2 (Vec2)
import GLMatrix.Vec2 as Vec2
import Partial.Unsafe (unsafePartial)

foreign import js_fromScaling :: Fn1 Vec2 Mat2d

-- |Creates a matrix from a vector scaling This is equivalent to (but much faster than): mat2d.identity(dest); mat2d.scale(dest, dest, vec);
fromScaling :: Vec2 -> Mat2d
fromScaling = runFn1 js_fromScaling

foreign import js_fromTranslation :: Fn1 Vec2 Mat2d

-- |Creates a matrix from a vector translation This is equivalent to (but much faster than): mat2d.identity(dest); mat2d.translate(dest, dest, vec);
fromTranslation :: Vec2 -> Mat2d
fromTranslation = runFn1 js_fromTranslation

foreign import js_scale :: Fn2 Mat2d Vec2 Mat2d

-- |Scales the Mat2d by the dimensions in the given vec2
scale :: Mat2d -> Vec2 -> Mat2d
scale = runFn2 js_scale

foreign import js_translate :: Fn2 Mat2d Vec2 Mat2d

-- |Translate a mat2d by the given vector
translate :: Mat2d -> Vec2 -> Mat2d
translate = runFn2 js_translate

fromVec2 :: Vec2 -> Vec2 -> Mat2d
fromVec2 v1 v2 = unsafePartial $ unsafeFromNumbers nums
  where
  nums = Vec2.numbers v1 <> (Vec2.numbers v2)
