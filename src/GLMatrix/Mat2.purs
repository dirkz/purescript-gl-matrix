module GLMatrix.Mat2 where

import Data.Function.Uncurried (Fn4, runFn4)
  
foreign import data Mat2 :: Type

foreign import js_fromValues :: Fn4 Number Number Number Number Mat2

fromValues :: Number -> Number -> Number -> Number -> Mat2
fromValues = runFn4 js_fromValues
