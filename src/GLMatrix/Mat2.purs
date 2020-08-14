module GLMatrix.Mat2 where

import Data.Function.Uncurried (Fn2, Fn4, runFn2, runFn4)
  
foreign import data Mat2 :: Type

foreign import js_fromValues :: Fn4 Number Number Number Number Mat2

-- |Create a new mat2 with the given values
fromValues :: Number -> Number -> Number -> Number -> Mat2
fromValues = runFn4 js_fromValues

foreign import js_add :: Fn2 Mat2 Mat2 Mat2

-- |Adds two mat2's
add :: Mat2 -> Mat2 -> Mat2
add = runFn2 js_add
