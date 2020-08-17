module GLMatrix.Mat2 where

import Data.Function.Uncurried (Fn0, Fn1, Fn2, Fn3, Fn4, runFn0, runFn1, runFn2, runFn3, runFn4)
import Partial.Unsafe (unsafeCrashWith, unsafePartial)
import Prelude (($))
import Prelude as Prelude

foreign import data Mat2 :: Type

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

foreign import js_epsilonEquals :: Fn2 Mat2 Mat2 Boolean

-- |Returns whether or not the matrices have approximately the same elements in the same position
epsilonEquals :: Mat2 -> Mat2 -> Boolean
epsilonEquals = runFn2 js_epsilonEquals

foreign import js_exactEquals :: Fn2 Mat2 Mat2 Boolean

-- |Returns whether or not the matrices have exactly the same elements in the same position (when compared with ===)
exactEquals :: Mat2 -> Mat2 -> Boolean
exactEquals = runFn2 js_exactEquals

foreign import js_frob :: Fn1 Mat2 Number

-- |Returns Frobenius norm of a mat2
frob :: Mat2 -> Number
frob = runFn1 js_frob

foreign import js_fromRotation :: Fn1 Number Mat2

-- |Creates a matrix from a given angle This is equivalent to (but much faster than): mat2.identity(dest); mat2.rotate(dest, dest, rad);
fromRotation :: Number -> Mat2
fromRotation = runFn1 js_fromRotation

foreign import js_fromValues :: Fn4 Number Number Number Number Mat2

-- |Create a new mat2 with the given values
fromValues :: Number -> Number -> Number -> Number -> Mat2
fromValues = runFn4 js_fromValues

foreign import js_identity :: Fn0 Mat2

-- |Set a mat2 to the identity matrix
identity :: Mat2
identity = runFn0 js_identity

foreign import js_invert :: Fn1 Mat2 Mat2

-- |Inverts a mat2
invert :: Mat2 -> Mat2
invert = runFn1 js_invert

type LDU
  = { l :: Mat2, d :: Mat2, u :: Mat2 }

foreign import js_ldu :: Fn1 Mat2 (Array Mat2)

-- |Returns L, D and U matrices (Lower triangular, Diagonal and Upper triangular) by factorizing the input matrix
ldu :: Mat2 -> LDU
ldu m = unsafePartial $ array3ToRecord $ runFn1 js_ldu m
  where
  array3ToRecord :: Partial => Array Mat2 -> LDU
  array3ToRecord [ a, b, c ] = { l: a, d: b, u: c }

foreign import js_multiply :: Fn2 Mat2 Mat2 Mat2

-- |Multiplies two mat2's
multiply :: Mat2 -> Mat2 -> Mat2
multiply = runFn2 js_multiply

foreign import js_multiplyScalar :: Fn2 Mat2 Number Mat2

-- |Multiply each element of the matrix by a scalar
multiplyScalar :: Mat2 -> Number -> Mat2
multiplyScalar = runFn2 js_multiplyScalar

foreign import js_multiplyScalarAndAdd :: Fn3 Mat2 Mat2 Number Mat2

-- |Adds two mat2's after multiplying each element of the second operand by a scalar value
multiplyScalarAndAdd :: Mat2 -> Mat2 -> Number -> Mat2
multiplyScalarAndAdd = runFn3 js_multiplyScalarAndAdd

foreign import js_rotate :: Fn2 Mat2 Number Mat2

-- |Rotates a mat2 by the given angle
rotate :: Mat2 -> Number -> Mat2
rotate = runFn2 js_rotate

foreign import js_str :: Fn1 Mat2 String

-- |Returns a string representation of a mat2
str :: Mat2 -> String
str = runFn1 js_str

foreign import js_subtract :: Fn2 Mat2 Mat2 Mat2

-- |Subtracts matrix b from matrix a
subtract :: Mat2 -> Mat2 -> Mat2
subtract = runFn2 js_subtract

foreign import js_transpose :: Fn1 Mat2 Mat2

-- |Transpose the values of a mat2
transpose :: Mat2 -> Mat2
transpose = runFn1 js_transpose

foreign import js_numbers :: Fn1 Mat2 (Array Number)

-- |Extract a number array
numbers :: Mat2 -> Array Number
numbers = runFn1 js_numbers

instance showMat2 :: Prelude.Show Mat2 where
  show = str

instance eqMat2 :: Prelude.Eq Mat2 where
  eq = exactEquals

-- |Map a function from `Number` to `Number` over the given matrix, producing
-- |a matrix.
-- |Note: Since a Matrix is not a general container, it cannot be a `Functor`.
map :: (Number -> Number) -> Mat2 -> Mat2
map fn v = fromNumbers $ Prelude.map fn $ numbers v
  where
  fromNumbers [ a, b, c, d ] = fromValues a b c d

  fromNumbers _ = unsafeCrashWith "Mat2.numbers must produce exactly 4 numbers"
