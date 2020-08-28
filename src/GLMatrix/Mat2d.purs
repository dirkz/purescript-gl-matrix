module GLMatrix.Mat2d
  ( Mat2d
  , add
  , determinant
  , equals
  , frob
  , fromRotation
  , fromValues
  , identity
  , invert
  , multiply
  , multiplyScalar
  , multiplyScalarAndAdd
  , rotate
  , subtract
  , numbers
  , map
  , unsafeFromNumbers
  , zipWith
  , slice
  ) where

import Data.Array as Array
import Data.Function.Uncurried (Fn0, Fn1, Fn2, Fn3, Fn6, runFn0, runFn1, runFn2, runFn3, runFn6)
import Partial.Unsafe (unsafePartial)
import Prelude (($))
import Prelude as Prelude

foreign import data Mat2d :: Type

foreign import js_add :: Fn2 Mat2d Mat2d Mat2d

-- |Adds two Mat2d's
add :: Mat2d -> Mat2d -> Mat2d
add = runFn2 js_add

foreign import js_determinant :: Fn1 Mat2d Number

-- |Calculates the determinant of a Mat2d
determinant :: Mat2d -> Number
determinant = runFn1 js_determinant

foreign import js_equals :: Fn2 Mat2d Mat2d Boolean

-- |Returns whether or not the matrices have approximately the same elements in the same position
equals :: Mat2d -> Mat2d -> Boolean
equals = runFn2 js_equals

foreign import js_exactEquals :: Fn2 Mat2d Mat2d Boolean

-- |Returns whether or not the matrices have exactly the same elements in the same position (when compared with ===)
exactEquals :: Mat2d -> Mat2d -> Boolean
exactEquals = runFn2 js_exactEquals

foreign import js_frob :: Fn1 Mat2d Number

-- |Returns Frobenius norm of a Mat2d
frob :: Mat2d -> Number
frob = runFn1 js_frob

foreign import js_fromRotation :: Fn1 Number Mat2d

-- |Creates a matrix from a given angle This is equivalent to (but much faster than): Mat2d.identity(dest); Mat2d.rotate(dest, dest, rad);
fromRotation :: Number -> Mat2d
fromRotation = runFn1 js_fromRotation

foreign import js_fromValues :: Fn6 Number Number Number Number Number Number Mat2d

-- |Create a new Mat2d with the given values
fromValues :: Number -> Number -> Number -> Number -> Number -> Number -> Mat2d
fromValues = runFn6 js_fromValues

foreign import js_identity :: Fn0 Mat2d

-- |Set a Mat2d to the identity matrix
identity :: Mat2d
identity = runFn0 js_identity

foreign import js_invert :: Fn1 Mat2d Mat2d

-- |Inverts a Mat2d
invert :: Mat2d -> Mat2d
invert = runFn1 js_invert

foreign import js_multiply :: Fn2 Mat2d Mat2d Mat2d

-- |Multiplies two Mat2d's
multiply :: Mat2d -> Mat2d -> Mat2d
multiply = runFn2 js_multiply

foreign import js_multiplyScalar :: Fn2 Mat2d Number Mat2d

-- |Multiply each element of the matrix by a scalar
multiplyScalar :: Mat2d -> Number -> Mat2d
multiplyScalar = runFn2 js_multiplyScalar

foreign import js_multiplyScalarAndAdd :: Fn3 Mat2d Mat2d Number Mat2d

-- |Adds two Mat2d's after multiplying each element of the second operand by a scalar value
multiplyScalarAndAdd :: Mat2d -> Mat2d -> Number -> Mat2d
multiplyScalarAndAdd = runFn3 js_multiplyScalarAndAdd

foreign import js_rotate :: Fn2 Mat2d Number Mat2d

-- |Rotates a Mat2d by the given angle
rotate :: Mat2d -> Number -> Mat2d
rotate = runFn2 js_rotate

foreign import js_str :: Fn1 Mat2d String

-- |Returns a string representation of a Mat2d
str :: Mat2d -> String
str = runFn1 js_str

foreign import js_subtract :: Fn2 Mat2d Mat2d Mat2d

-- |Subtracts matrix b from matrix a
subtract :: Mat2d -> Mat2d -> Mat2d
subtract = runFn2 js_subtract

foreign import js_numbers :: Fn1 Mat2d (Array Number)

-- |Extract a number array
numbers :: Mat2d -> Array Number
numbers = runFn1 js_numbers

-- |Create a matrix from an array produced by `numbers`.
unsafeFromNumbers :: Partial => Array Number -> Mat2d
unsafeFromNumbers [ a, b, c, d, tx, ty ] = fromValues a b c d tx ty

instance showMat2d :: Prelude.Show Mat2d where
  show = str

instance eqMat2d :: Prelude.Eq Mat2d where
  eq = exactEquals

-- |Map a function from `Number` to `Number` over it.
-- |Note: Since this is not a general container, it cannot be a `Functor`.
map :: (Number -> Number) -> Mat2d -> Mat2d
map fn v = unsafePartial $ unsafeFromNumbers $ Prelude.map fn $ numbers v

zipWith :: (Number -> Number -> Number) -> Mat2d -> Mat2d -> Mat2d
zipWith fn v1 v2 = unsafePartial $ unsafeFromNumbers $ Array.zipWith fn (numbers v1) (numbers v2)

-- |Like `Array.slice`
slice :: Int -> Int -> Mat2d -> Array Number
slice a b m = Array.slice a b $ numbers m
