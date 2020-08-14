module GLMatrix.Mat2 where

import Data.Function.Uncurried (Fn2, Fn4, Fn1, runFn1, runFn2, runFn4)
  
foreign import data Mat2 :: Type

foreign import js_fromValues :: Fn4 Number Number Number Number Mat2

-- |Create a new mat2 with the given values
fromValues :: Number -> Number -> Number -> Number -> Mat2
fromValues = runFn4 js_fromValues

foreign import js_add :: Fn2 Mat2 Mat2 Mat2

-- |Adds two mat2's
add :: Mat2 -> Mat2 -> Mat2
add = runFn2 js_add

foreign import js_adjoint :: Fn1 Mat2 Mat2

-- |Calculates the adjugate of a mat2
adjoint :: Mat2 -> Mat2
adjoint = runFn1 js_adjoint

foreign import js_determinant :: Fn1 Mat2 Number

-- |Calculates the determinant of a mat2
determinant :: Mat2 -> Number
determinant = runFn1 js_determinant

foreign import js_equals :: Fn2 Mat2 Mat2 Boolean

-- |Returns whether or not the matrices have approximately the same elements in the same position
equals :: Mat2 -> Mat2 -> Boolean
equals = runFn2 js_equals

foreign import js_exactEquals :: Fn2 Mat2 Mat2 Boolean

-- |Returns whether or not the matrices have exactly the same elements in the same position (when compared with ===)
exactEquals :: Mat2 -> Mat2 -> Boolean
exactEquals = runFn2 js_exactEquals
