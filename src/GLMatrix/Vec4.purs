module GLMatrix.Vec4
  ( Vec4
  , add
  , angle
  , ceil
  , cross
  , distance
  , divide
  , dot
  , epsilonEquals
  , floor
  , fromValues
  , inverse
  , length
  , lerp
  , max
  , min
  , multiply
  , negate
  , normalize
  , rotateX
  , rotateY
  , rotateZ
  , round
  , scale
  , scaleAndAdd
  , squaredDistance
  , squaredLength
  , subtract
  , transformMat3
  , zero
  , numbers
  , map
  , unsafeFromNumbers
  , zipWith
  ) where

import Data.Array as Array
import Data.Function.Uncurried (Fn0, Fn1, Fn2, Fn3, runFn0, runFn1, runFn2, runFn3)
import GLMatrix.Mat3 (Mat3)
import Partial.Unsafe (unsafePartial)
import Prelude (($))
import Prelude as Prelude

foreign import data Vec4 :: Type

foreign import js_add :: Fn2 Vec4 Vec4 Vec4

-- |Adds two Vec4's
add :: Vec4 -> Vec4 -> Vec4
add = runFn2 js_add

foreign import js_angle :: Fn2 Vec4 Vec4 Number

-- |Get the angle between two 2D vectors
angle :: Vec4 -> Vec4 -> Number
angle = runFn2 js_angle

foreign import js_ceil :: Fn1 Vec4 Vec4

-- |Math.ceil the components of a Vec4
ceil :: Vec4 -> Vec4
ceil = runFn1 js_ceil

foreign import js_cross :: Fn2 Vec4 Vec4 Vec4

cross :: Vec4 -> Vec4 -> Vec4
cross = runFn2 js_cross

foreign import js_distance :: Fn2 Vec4 Vec4 Number

-- |Calculates the euclidian distance between two Vec4's
distance :: Vec4 -> Vec4 -> Number
distance = runFn2 js_distance

foreign import js_divide :: Fn2 Vec4 Vec4 Vec4

-- |Divides two Vec4's
divide :: Vec4 -> Vec4 -> Vec4
divide = runFn2 js_divide

foreign import js_dot :: Fn2 Vec4 Vec4 Number

-- |Calculates the dot product of two Vec4's
dot :: Vec4 -> Vec4 -> Number
dot = runFn2 js_dot

foreign import js_epsilonEquals :: Fn2 Vec4 Vec4 Boolean

-- |Returns whether or not the vectors have approximately the same elements in the same position
epsilonEquals :: Vec4 -> Vec4 -> Boolean
epsilonEquals = runFn2 js_epsilonEquals

foreign import js_exactEquals :: Fn2 Vec4 Vec4 Boolean

-- |Returns whether or not the vectors exactly have the same elements in the same position (when compared with ===)
exactEquals :: Vec4 -> Vec4 -> Boolean
exactEquals = runFn2 js_exactEquals

foreign import js_floor :: Fn1 Vec4 Vec4

-- |Math.floor the components of a Vec4
floor :: Vec4 -> Vec4
floor = runFn1 js_floor

foreign import js_fromValues :: Fn3 Number Number Number Vec4

-- |Creates a new Vec4 initialized with the given values
fromValues :: Number -> Number -> Number -> Vec4
fromValues = runFn3 js_fromValues

foreign import js_inverse :: Fn1 Vec4 Vec4

-- |Returns the inverse of the components of a Vec4
inverse :: Vec4 -> Vec4
inverse = runFn1 js_inverse

foreign import js_length :: Fn1 Vec4 Number

-- |Calculates the length of a Vec4
length :: Vec4 -> Number
length = runFn1 js_length

foreign import js_lerp :: Fn3 Vec4 Vec4 Number Vec4

-- |Performs a linear interpolation between two Vec4's
lerp :: Vec4 -> Vec4 -> Number -> Vec4
lerp = runFn3 js_lerp

foreign import js_max :: Fn2 Vec4 Vec4 Vec4

-- |Returns the maximum of two Vec4's
max :: Vec4 -> Vec4 -> Vec4
max = runFn2 js_max

foreign import js_min :: Fn2 Vec4 Vec4 Vec4

-- |Returns the minimum of two Vec4's
min :: Vec4 -> Vec4 -> Vec4
min = runFn2 js_min

foreign import js_multiply :: Fn2 Vec4 Vec4 Vec4

-- |Multiplies two Vec4's
multiply :: Vec4 -> Vec4 -> Vec4
multiply = runFn2 js_multiply

foreign import js_negate :: Fn1 Vec4 Vec4

-- |Negates the components of a Vec4
negate :: Vec4 -> Vec4
negate = runFn1 js_negate

foreign import js_normalize :: Fn1 Vec4 Vec4

-- |Normalize a Vec4
normalize :: Vec4 -> Vec4
normalize = runFn1 js_normalize

foreign import js_rotateX :: Fn3 Vec4 Vec4 Number Vec4

-- |Rotate a 3D vector around the x-axis
rotateX :: Vec4 -> Vec4 -> Number -> Vec4
rotateX = runFn3 js_rotateX

foreign import js_rotateY :: Fn3 Vec4 Vec4 Number Vec4

-- |Rotate a 3D vector around the y-axis
rotateY :: Vec4 -> Vec4 -> Number -> Vec4
rotateY = runFn3 js_rotateY

foreign import js_rotateZ :: Fn3 Vec4 Vec4 Number Vec4

-- |Rotate a 3D vector around the z-axis
rotateZ :: Vec4 -> Vec4 -> Number -> Vec4
rotateZ = runFn3 js_rotateZ

foreign import js_round :: Fn1 Vec4 Vec4

-- |Math.round the components of a Vec4
round :: Vec4 -> Vec4
round = runFn1 js_round

foreign import js_scale :: Fn2 Vec4 Number Vec4

-- |Scales a Vec4 by a scalar number
scale :: Vec4 -> Number -> Vec4
scale = runFn2 js_scale

foreign import js_scaleAndAdd :: Fn3 Vec4 Vec4 Number Vec4

-- |Adds two Vec4's after scaling the second operand by a scalar value
scaleAndAdd :: Vec4 -> Vec4 -> Number -> Vec4
scaleAndAdd = runFn3 js_scaleAndAdd

foreign import js_squaredDistance :: Fn2 Vec4 Vec4 Number

-- |Calculates the squared euclidian distance between two Vec4's
squaredDistance :: Vec4 -> Vec4 -> Number
squaredDistance = runFn2 js_squaredDistance

foreign import js_squaredLength :: Fn1 Vec4 Number

-- |Calculates the squared length of a Vec4
squaredLength :: Vec4 -> Number
squaredLength = runFn1 js_squaredLength

foreign import js_str :: Fn1 Vec4 String

-- |Returns a string representation of a vector
str :: Vec4 -> String
str = runFn1 js_str

foreign import js_subtract :: Fn2 Vec4 Vec4 Vec4

-- |Subtracts vector b from vector a
subtract :: Vec4 -> Vec4 -> Vec4
subtract = runFn2 js_subtract

-- TODO: (static) transformMat2d(out, a, m) → {Vec4}

foreign import js_transformMat3 :: Fn2 Vec4 Mat3 Vec4

transformMat3 :: Vec4 -> Mat3 -> Vec4
transformMat3 = runFn2 js_transformMat3

-- TODO: (static) transformMat4(out, a, m) → {Vec4}
foreign import js_zero :: Fn0 Vec4

zero :: Vec4
zero = runFn0 js_zero

foreign import js_numbers :: Fn1 Vec4 (Array Number)

-- |Extract a number array
numbers :: Vec4 -> Array Number
numbers = runFn1 js_numbers

-- |Create a vector from an array produced by `numbers`.
unsafeFromNumbers :: Partial => Array Number -> Vec4
unsafeFromNumbers [ x, y, z ] = fromValues x y z

instance showVec4 :: Prelude.Show Vec4 where
  show = str

instance eqVec4 :: Prelude.Eq Vec4 where
  eq = exactEquals

-- |Map a function from `Number` to `Number` over it the given vector, producing
-- |a vector.
-- |Note: Since a Vector is not a general container, it cannot be a `Functor`.
map :: (Number -> Number) -> Vec4 -> Vec4
map fn v = unsafePartial $ unsafeFromNumbers $ Prelude.map fn $ numbers v

zipWith :: (Number -> Number -> Number) -> Vec4 -> Vec4 -> Vec4
zipWith fn v1 v2 = unsafePartial $ unsafeFromNumbers $ Array.zipWith fn (numbers v1) (numbers v2)
