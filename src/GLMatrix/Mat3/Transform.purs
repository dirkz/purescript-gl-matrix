module GLMatrix.Mat3.Transform
  ( fromScaling
  , fromTranslation
  ) where

import Data.Function.Uncurried (Fn1, runFn1)
import GLMatrix.Mat3 (Mat3)
import GLMatrix.Vec2 (Vec2)

foreign import js_fromScaling :: Fn1 Vec2 Mat3

-- |Creates a matrix from a vector scaling This is equivalent to (but much faster than): mat3.identity(dest); mat3.scale(dest, dest, vec);
fromScaling :: Vec2 -> Mat3
fromScaling = runFn1 js_fromScaling

foreign import js_fromTranslation :: Fn1 Vec2 Mat3

-- |Creates a matrix from a vector translation This is equivalent to (but much faster than): mat3.identity(dest); mat3.translate(dest, dest, vec);
fromTranslation :: Vec2 -> Mat3
fromTranslation = runFn1 js_fromScaling
