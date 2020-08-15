module GLMatrix.ArrayType where

import Data.Function.Uncurried (Fn1, runFn1)

-- |Represents the array type used internally by glMatrix,
-- |either Float32Array of an array of numbers.
foreign import data ArrayType :: Type

foreign import js_numbers :: Fn1 ArrayType (Array Number)

-- |Extract a number array
numbers :: ArrayType -> Array Number
numbers = runFn1 js_numbers
