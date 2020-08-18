module GLMatrix.Vec3
  ( Vec3
  , add
  , angle
  , ceil
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
  , zero
  , numbers
  , map
  , unsafeFromNumbers
  , zipWith
  ) where

import Data.Array as Array
import Data.Function.Uncurried (Fn0, Fn1, Fn2, Fn3, runFn0, runFn1, runFn2, runFn3)
import Partial.Unsafe (unsafePartial)
import Prelude (($))
import Prelude as Prelude

foreign import data Vec3 :: Type

foreign import js_add :: Fn2 Vec3 Vec3 Vec3

-- |Adds two Vec3's
add :: Vec3 -> Vec3 -> Vec3
add = runFn2 js_add

foreign import js_angle :: Fn2 Vec3 Vec3 Number

-- |Get the angle between two 2D vectors
angle :: Vec3 -> Vec3 -> Number
angle = runFn2 js_angle

foreign import js_ceil :: Fn1 Vec3 Vec3

-- |Math.ceil the components of a Vec3
ceil :: Vec3 -> Vec3
ceil = runFn1 js_ceil

-- TODO: (static) cross(out, a, b) → {vec3}
foreign import js_distance :: Fn2 Vec3 Vec3 Number

-- |Calculates the euclidian distance between two Vec3's
distance :: Vec3 -> Vec3 -> Number
distance = runFn2 js_distance

foreign import js_divide :: Fn2 Vec3 Vec3 Vec3

-- |Divides two Vec3's
divide :: Vec3 -> Vec3 -> Vec3
divide = runFn2 js_divide

foreign import js_dot :: Fn2 Vec3 Vec3 Number

-- |Calculates the dot product of two Vec3's
dot :: Vec3 -> Vec3 -> Number
dot = runFn2 js_dot

foreign import js_epsilonEquals :: Fn2 Vec3 Vec3 Boolean

-- |Returns whether or not the vectors have approximately the same elements in the same position
epsilonEquals :: Vec3 -> Vec3 -> Boolean
epsilonEquals = runFn2 js_epsilonEquals

foreign import js_exactEquals :: Fn2 Vec3 Vec3 Boolean

-- |Returns whether or not the vectors exactly have the same elements in the same position (when compared with ===)
exactEquals :: Vec3 -> Vec3 -> Boolean
exactEquals = runFn2 js_exactEquals

foreign import js_floor :: Fn1 Vec3 Vec3

-- |Math.floor the components of a Vec3
floor :: Vec3 -> Vec3
floor = runFn1 js_floor

foreign import js_fromValues :: Fn3 Number Number Number Vec3

-- |Creates a new Vec3 initialized with the given values
fromValues :: Number -> Number -> Number -> Vec3
fromValues = runFn3 js_fromValues

foreign import js_inverse :: Fn1 Vec3 Vec3

-- |Returns the inverse of the components of a Vec3
inverse :: Vec3 -> Vec3
inverse = runFn1 js_inverse

foreign import js_length :: Fn1 Vec3 Number

-- |Calculates the length of a Vec3
length :: Vec3 -> Number
length = runFn1 js_length

foreign import js_lerp :: Fn3 Vec3 Vec3 Number Vec3

-- |Performs a linear interpolation between two Vec3's
lerp :: Vec3 -> Vec3 -> Number -> Vec3
lerp = runFn3 js_lerp

foreign import js_max :: Fn2 Vec3 Vec3 Vec3

-- |Returns the maximum of two Vec3's
max :: Vec3 -> Vec3 -> Vec3
max = runFn2 js_max

foreign import js_min :: Fn2 Vec3 Vec3 Vec3

-- |Returns the minimum of two Vec3's
min :: Vec3 -> Vec3 -> Vec3
min = runFn2 js_min

foreign import js_multiply :: Fn2 Vec3 Vec3 Vec3

-- |Multiplies two Vec3's
multiply :: Vec3 -> Vec3 -> Vec3
multiply = runFn2 js_multiply

foreign import js_negate :: Fn1 Vec3 Vec3

-- |Negates the components of a Vec3
negate :: Vec3 -> Vec3
negate = runFn1 js_negate

foreign import js_normalize :: Fn1 Vec3 Vec3

-- |Normalize a Vec3
normalize :: Vec3 -> Vec3
normalize = runFn1 js_normalize

foreign import js_rotateX :: Fn3 Vec3 Vec3 Number Vec3

-- |Rotate a 3D vector around the x-axis
rotateX :: Vec3 -> Vec3 -> Number -> Vec3
rotateX = runFn3 js_rotateX

foreign import js_rotateY :: Fn3 Vec3 Vec3 Number Vec3

-- |Rotate a 3D vector around the y-axis
rotateY :: Vec3 -> Vec3 -> Number -> Vec3
rotateY = runFn3 js_rotateY

foreign import js_rotateZ :: Fn3 Vec3 Vec3 Number Vec3

-- |Rotate a 3D vector around the z-axis
rotateZ :: Vec3 -> Vec3 -> Number -> Vec3
rotateZ = runFn3 js_rotateZ

foreign import js_round :: Fn1 Vec3 Vec3

-- |Math.round the components of a Vec3
round :: Vec3 -> Vec3
round = runFn1 js_round

foreign import js_scale :: Fn2 Vec3 Number Vec3

-- |Scales a Vec3 by a scalar number
scale :: Vec3 -> Number -> Vec3
scale = runFn2 js_scale

foreign import js_scaleAndAdd :: Fn3 Vec3 Vec3 Number Vec3

-- |Adds two Vec3's after scaling the second operand by a scalar value
scaleAndAdd :: Vec3 -> Vec3 -> Number -> Vec3
scaleAndAdd = runFn3 js_scaleAndAdd

foreign import js_squaredDistance :: Fn2 Vec3 Vec3 Number

-- |Calculates the squared euclidian distance between two Vec3's
squaredDistance :: Vec3 -> Vec3 -> Number
squaredDistance = runFn2 js_squaredDistance

foreign import js_squaredLength :: Fn1 Vec3 Number

-- |Calculates the squared length of a Vec3
squaredLength :: Vec3 -> Number
squaredLength = runFn1 js_squaredLength

foreign import js_str :: Fn1 Vec3 String

-- |Returns a string representation of a vector
str :: Vec3 -> String
str = runFn1 js_str

foreign import js_subtract :: Fn2 Vec3 Vec3 Vec3

-- |Subtracts vector b from vector a
subtract :: Vec3 -> Vec3 -> Vec3
subtract = runFn2 js_subtract

-- TODO: (static) transformMat2d(out, a, m) → {Vec3}
-- TODO: (static) transformMat3(out, a, m) → {Vec3}
-- TODO: (static) transformMat4(out, a, m) → {Vec3}
foreign import js_zero :: Fn0 Vec3

zero :: Vec3
zero = runFn0 js_zero

foreign import js_numbers :: Fn1 Vec3 (Array Number)

-- |Extract a number array
numbers :: Vec3 -> Array Number
numbers = runFn1 js_numbers

-- |Create a vector from an array produced by `numbers`.
unsafeFromNumbers :: Partial => Array Number -> Vec3
unsafeFromNumbers [ x, y, z ] = fromValues x y z

instance showVec3 :: Prelude.Show Vec3 where
  show = str

instance eqVec3 :: Prelude.Eq Vec3 where
  eq = exactEquals

-- |Map a function from `Number` to `Number` over it the given vector, producing
-- |a vector.
-- |Note: Since a Vector is not a general container, it cannot be a `Functor`.
map :: (Number -> Number) -> Vec3 -> Vec3
map fn v = unsafePartial $ unsafeFromNumbers $ Prelude.map fn $ numbers v

zipWith :: (Number -> Number -> Number) -> Vec3 -> Vec3 -> Vec3
zipWith fn v1 v2 = unsafePartial $ unsafeFromNumbers $ Array.zipWith fn (numbers v1) (numbers v2)
