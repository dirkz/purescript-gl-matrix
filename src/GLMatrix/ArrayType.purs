module GLMatrix.ArrayType where

import Prelude

import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)

-- |Represents the array type used internally by glMatrix,
-- |either Float32Array of an array of numbers.
foreign import data ArrayType :: Type

foreign import js_numbers :: Fn1 ArrayType (Array Number)

-- |Extract a number array
numbers :: ArrayType -> Array Number
numbers = runFn1 js_numbers

foreign import js_str :: Fn1 ArrayType String

-- |Returns a string representation of a mat2
str :: ArrayType -> String
str = runFn1 js_str

foreign import js_epsilonEquals :: Fn2 ArrayType ArrayType Boolean

-- |Returns whether or not the matrices have approximately the same elements in the same position
epsilonEquals :: ArrayType -> ArrayType -> Boolean
epsilonEquals = runFn2 js_epsilonEquals

foreign import js_exactEquals :: Fn2 ArrayType ArrayType Boolean

-- |Returns whether or not the matrices have exactly the same elements in the same position (when compared with ===)
exactEquals :: ArrayType -> ArrayType -> Boolean
exactEquals = runFn2 js_exactEquals

instance showArrayType :: Show ArrayType where
  show = str

instance eqArrayType :: Eq ArrayType where
  eq = exactEquals
