module GLMatrix.Mat4
  ( Mat4
  , FieldOfView
  , fieldOfView
  , add
  , adjoint
  , determinant
  , equals
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
  , getTranslation
  , identity
  , invert
  , lookAt
  , multiply
  , multiplyScalar
  , multiplyScalarAndAdd
  , ortho
  , perspective
  , perspectiveFromFieldOfView
  , rotate
  , rotateX
  , rotateY
  , rotateZ
  , scale
  , subtract
  , targetTo
  , translate
  , transpose
  , numbers
  , map
  , unsafeFromNumbers
  , slice
  , zipWith
  ) where

import Data.Array as Array
import Data.Function.Uncurried (Fn0, Fn1, Fn2, Fn3, Fn4, Fn6, runFn0, runFn1, runFn2, runFn3, runFn4, runFn6)
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

foreign import js_equals :: Fn2 Mat4 Mat4 Boolean

-- |Returns whether or not the matrices have approximately the same elements in the same position
equals :: Mat4 -> Mat4 -> Boolean
equals = runFn2 js_equals

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

foreign import js_fromValues :: Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Mat4

-- |Create a new Mat4 with the given values
fromValues :: Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Number -> Mat4
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

foreign import js_getTranslation :: Fn1 Mat4 Vec3

-- |Returns the translation vector component of a transformation matrix. If a matrix is built with fromRotationTranslation, the returned vector will be the same as the translation vector originally supplied.
getTranslation :: Mat4 -> Vec3
getTranslation = runFn1 js_getTranslation

foreign import js_identity :: Fn0 Mat4

-- |Set a Mat4 to the identity matrix
identity :: Mat4
identity = runFn0 js_identity

foreign import js_lookAt :: Fn3 Vec3 Vec3 Vec3 Mat4

-- |Generates a look-at matrix with the given eye position, focal point, and up axis. If you want a matrix that actually makes an object look at another object, you should use targetTo instead.
lookAt :: Vec3 -> Vec3 -> Vec3 -> Mat4
lookAt = runFn3 js_lookAt

foreign import js_translate :: Fn2 Mat4 Vec3 Mat4

-- |Translate a mat4 by the given vector
translate :: Mat4 -> Vec3 -> Mat4
translate = runFn2 js_translate

foreign import js_invert :: Fn1 Mat4 Mat4

-- |Inverts a Mat4
invert :: Mat4 -> Mat4
invert = runFn1 js_invert

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

foreign import js_ortho :: Fn6 Number Number Number Number Number Number Mat4

-- |Generates a orthogonal projection matrix with the given bounds
ortho :: Number -> Number -> Number -> Number -> Number -> Number -> Mat4
ortho = runFn6 js_ortho

foreign import js_perspective :: Fn4 Number Number Number Number Mat4

-- |Generates a perspective projection matrix with the given bounds. Passing null/undefined/no value for far will generate infinite projection matrix.
perspective :: Number -> Number -> Number -> Number -> Mat4
perspective = runFn4 js_perspective

type FieldOfView
  = { upDegrees :: Number
    , downDegrees :: Number
    , leftDegrees :: Number
    , rightDegrees :: Number
    }

fieldOfView ::
  Number ->
  Number ->
  Number ->
  Number ->
  FieldOfView
fieldOfView upDegrees downDegrees leftDegrees rightDegrees =
  { upDegrees
  , downDegrees
  , leftDegrees
  , rightDegrees
  }

foreign import js_perspectiveFromFieldOfView :: Fn3 FieldOfView Number Number Mat4

-- |Generates a perspective projection matrix with the given field of view. This is primarily useful for generating projection matrices to be used with the still experiemental WebVR API.
perspectiveFromFieldOfView :: FieldOfView -> Number -> Number -> Mat4
perspectiveFromFieldOfView = runFn3 js_perspectiveFromFieldOfView

foreign import js_rotate :: Fn3 Mat4 Number Vec3 Mat4

-- |Rotates a mat4 by the given angle around the given axis
rotate :: Mat4 -> Number -> Vec3 -> Mat4
rotate = runFn3 js_rotate

foreign import js_rotateX :: Fn2 Mat4 Number Mat4

-- |Rotates a matrix by the given angle around the X axis
rotateX :: Mat4 -> Number -> Mat4
rotateX = runFn2 js_rotateX

foreign import js_rotateY :: Fn2 Mat4 Number Mat4

-- |Rotates a matrix by the given angle around the Y axis
rotateY :: Mat4 -> Number -> Mat4
rotateY = runFn2 js_rotateY

foreign import js_rotateZ :: Fn2 Mat4 Number Mat4

-- |Rotates a matrix by the given angle around the Z axis
rotateZ :: Mat4 -> Number -> Mat4
rotateZ = runFn2 js_rotateZ

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

foreign import js_targetTo :: Fn3 Vec3 Vec3 Vec3 Mat4

-- |Generates a matrix that makes something look at something else.
targetTo :: Vec3 -> Vec3 -> Vec3 -> Mat4
targetTo = runFn3 js_targetTo

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
