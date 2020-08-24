module GLMatrix.Mat4
  ( Mat4
  , LDU
  , add
  , adjoint
  , determinant
  , epsilonEquals
  , frob
  , fromRotation
  , fromScaling
  , fromTranslation
  , fromValues
  , fromXRotation
  , fromYRotation
  , fromZRotation
  , frustum
  , getScaling
  , identity
  , invert
  , ldu
  , multiply
  , multiplyScalar
  , multiplyScalarAndAdd
  , rotate
  , scale
  , subtract
  , transpose
  , numbers
  , map
  , unsafeFromNumbers
  , slice
  , zipWith
  ) where

import Data.Array as Array
import Data.Function.Uncurried (Fn0, Fn1, Fn2, Fn3, Fn6, runFn0, runFn1, runFn2, runFn3, runFn6)
import GLMatrix.Vec3 (Vec3)
import Partial.Unsafe (unsafePartial)
import Prelude (($))
import Prelude as Prelude

foreign import data Mat4 :: Type

foreign import js_add :: Fn2 Mat4 Mat4 Mat4

-- |Adds two Mat4's
add :: Mat4 -> Mat4 -> Mat4
add = runFn2 js_add

foreign import js_adjoint :: Fn1 Mat4 Mat4

-- |Calculates the adjugate of a Mat4
adjoint :: Mat4 -> Mat4
adjoint = runFn1 js_adjoint

foreign import js_determinant :: Fn1 Mat4 Number

-- |Calculates the determinant of a Mat4
determinant :: Mat4 -> Number
determinant = runFn1 js_determinant

foreign import js_epsilonEquals :: Fn2 Mat4 Mat4 Boolean

-- |Returns whether or not the matrices have approximately the same elements in the same position
epsilonEquals :: Mat4 -> Mat4 -> Boolean
epsilonEquals = runFn2 js_epsilonEquals

foreign import js_exactEquals :: Fn2 Mat4 Mat4 Boolean

-- |Returns whether or not the matrices have exactly the same elements in the same position (when compared with ===)
exactEquals :: Mat4 -> Mat4 -> Boolean
exactEquals = runFn2 js_exactEquals

foreign import js_frob :: Fn1 Mat4 Number

-- |Returns Frobenius norm of a Mat4
frob :: Mat4 -> Number
frob = runFn1 js_frob

foreign import js_fromRotation :: Fn2 Number Vec3 Mat4

-- |Creates a matrix from a given angle around a given axis This is equivalent to (but much faster than): mat4.identity(dest); mat4.rotate(dest, dest, rad, axis);
fromRotation :: Number -> Vec3 -> Mat4
fromRotation = runFn2 js_fromRotation

foreign import js_fromScaling :: Fn1 Vec3 Mat4

-- |Creates a matrix from a vector scaling This is equivalent to (but much faster than): mat4.identity(dest); mat4.scale(dest, dest, vec);
fromScaling :: Vec3 -> Mat4
fromScaling = runFn1 js_fromScaling

foreign import js_fromTranslation :: Fn1 Vec3 Mat4

-- |Creates a matrix from a vector translation This is equivalent to (but much faster than): mat4.identity(dest); mat4.translate(dest, dest, vec);
fromTranslation :: Vec3 -> Mat4
fromTranslation = runFn1 js_fromTranslation

foreign import js_fromValues :: Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number ->  Number ->  Number ->  Number ->  Number ->  Number ->  Number -> Mat4

-- |Create a new Mat4 with the given values
fromValues :: Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number ->  Number ->  Number ->  Number ->  Number ->  Number ->  Number -> Mat4
fromValues = js_fromValues

foreign import js_fromXRotation :: Fn1 Number Mat4

-- |Creates a matrix from the given angle around the X axis This is equivalent to (but much faster than): mat4.identity(dest); mat4.rotateX(dest, dest, rad);
fromXRotation :: Number -> Mat4
fromXRotation = runFn1 js_fromXRotation

foreign import js_fromYRotation :: Fn1 Number Mat4

-- |Creates a matrix from the given angle around the Y axis This is equivalent to (but much faster than): mat4.identity(dest); mat4.rotateY(dest, dest, rad);
fromYRotation :: Number -> Mat4
fromYRotation = runFn1 js_fromYRotation

foreign import js_fromZRotation :: Fn1 Number Mat4

-- |Creates a matrix from the given angle around the Z axis This is equivalent to (but much faster than): mat4.identity(dest); mat4.rotateZ(dest, dest, rad);
fromZRotation :: Number -> Mat4
fromZRotation = runFn1 js_fromZRotation

foreign import js_frustum :: Fn6 Number Number Number Number Number Number Mat4

-- |Generates a frustum matrix with the given bounds
frustum :: Number -> Number -> Number -> Number -> Number -> Number -> Mat4
frustum = runFn6 js_frustum

foreign import js_getScaling :: Fn1 Mat4 Vec3

-- |Returns the scaling factor component of a transformation matrix. If a matrix is built with fromRotationTranslationScale with a normalized Quaternion paramter, the returned vector will be the same as the scaling vector originally supplied.
getScaling :: Mat4 -> Vec3
getScaling = runFn1 js_getScaling

foreign import js_identity :: Fn0 Mat4

-- |Set a Mat4 to the identity matrix
identity :: Mat4
identity = runFn0 js_identity

foreign import js_invert :: Fn1 Mat4 Mat4

-- |Inverts a Mat4
invert :: Mat4 -> Mat4
invert = runFn1 js_invert

type LDU
  = { l :: Mat4, d :: Mat4, u :: Mat4 }

foreign import js_ldu :: Fn1 Mat4 (Array Mat4)

-- |Returns L, D and U matrices (Lower triangular, Diagonal and Upper triangular) by factorizing the input matrix
ldu :: Mat4 -> LDU
ldu m = unsafePartial $ array3ToRecord $ runFn1 js_ldu m
  where
  array3ToRecord :: Partial => Array Mat4 -> LDU
  array3ToRecord [ a, b, c ] = { l: a, d: b, u: c }

foreign import js_multiply :: Fn2 Mat4 Mat4 Mat4

-- |Multiplies two Mat4's
multiply :: Mat4 -> Mat4 -> Mat4
multiply = runFn2 js_multiply

foreign import js_multiplyScalar :: Fn2 Mat4 Number Mat4

-- |Multiply each element of the matrix by a scalar
multiplyScalar :: Mat4 -> Number -> Mat4
multiplyScalar = runFn2 js_multiplyScalar

foreign import js_multiplyScalarAndAdd :: Fn3 Mat4 Mat4 Number Mat4

-- |Adds two Mat4's after multiplying each element of the second operand by a scalar value
multiplyScalarAndAdd :: Mat4 -> Mat4 -> Number -> Mat4
multiplyScalarAndAdd = runFn3 js_multiplyScalarAndAdd

foreign import js_rotate :: Fn3 Mat4 Number Vec3 Mat4

-- |Rotates a mat4 by the given angle around the given axis
rotate :: Mat4 -> Number -> Vec3 -> Mat4
rotate = runFn3 js_rotate

foreign import js_scale :: Fn2 Mat4 Vec3 Mat4

-- |Scales the mat4 by the dimensions in the given vec3 not using vectorization
scale :: Mat4 -> Vec3 -> Mat4
scale = runFn2 js_scale

foreign import js_str :: Fn1 Mat4 String

-- |Returns a string representation of a Mat4
str :: Mat4 -> String
str = runFn1 js_str

foreign import js_subtract :: Fn2 Mat4 Mat4 Mat4

-- |Subtracts matrix b from matrix a
subtract :: Mat4 -> Mat4 -> Mat4
subtract = runFn2 js_subtract

foreign import js_transpose :: Fn1 Mat4 Mat4

-- |Transpose the values of a Mat4
transpose :: Mat4 -> Mat4
transpose = runFn1 js_transpose

foreign import js_numbers :: Fn1 Mat4 (Array Number)

-- |Extract a number array
numbers :: Mat4 -> Array Number
numbers = runFn1 js_numbers

-- |Create a matrix from an array produced by `numbers`.
unsafeFromNumbers :: Partial => Array Number -> Mat4
unsafeFromNumbers [ m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33 ] = fromValues m00 m01 m02 m03 m10 m11 m12 m13 m20 m21 m22 m23 m30 m31 m32 m33

instance showMat4 :: Prelude.Show Mat4 where
  show = str

instance eqMat4 :: Prelude.Eq Mat4 where
  eq = exactEquals

-- |Map a function from `Number` to `Number` over it.
-- |Note: Since this is not a general container, it cannot be a `Functor`.
map :: (Number -> Number) -> Mat4 -> Mat4
map fn v = unsafePartial $ unsafeFromNumbers $ Prelude.map fn $ numbers v

zipWith :: (Number -> Number -> Number) -> Mat4 -> Mat4 -> Mat4
zipWith fn v1 v2 = unsafePartial $ unsafeFromNumbers $ Array.zipWith fn (numbers v1) (numbers v2)

-- |Like `Array.slice`
slice :: Int -> Int -> Mat4 -> Array Number
slice a b m = Array.slice a b $ numbers m
