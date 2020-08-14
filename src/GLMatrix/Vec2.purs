module GLMatrix.Vec2 where
  
import Prelude
import Data.Function.Uncurried (Fn0, Fn1, Fn2, Fn3, Fn4, runFn0, runFn1, runFn2, runFn3, runFn4)

foreign import data Vec2 :: Type

foreign import js_add :: Fn2 Vec2 Vec2 Vec2

-- |Adds two vec2's
add :: Vec2 -> Vec2 -> Vec2
add = runFn2 js_add

