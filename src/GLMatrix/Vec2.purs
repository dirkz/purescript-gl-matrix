module GLMatrix.Vec2
  ( Vec2
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
  , rotate
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
import GLMatrix.Vec3 (Vec3)
import Partial.Unsafe (unsafePartial)
import Prelude (($))
import Prelude as Prelude

foreign import data Vec2 :: Type

foreign import js_add :: Fn2 Vec2 Vec2 Vec2

-- |Adds two vec2's
add :: Vec2 -> Vec2 -> Vec2
add = runFn2 js_add

foreign import js_angle :: Fn2 Vec2 Vec2 Number

-- |Get the angle between two 2D vectors
angle :: Vec2 -> Vec2 -> Number
angle = runFn2 js_angle

foreign import js_ceil :: Fn1 Vec2 Vec2

-- |Math.ceil the components of a vec2
ceil :: Vec2 -> Vec2
ceil = runFn1 js_ceil

foreign import js_cross :: Fn2 Vec2 Vec2 Vec3

cross :: Vec2 -> Vec2 -> Vec3
cross = runFn2 js_cross

foreign import js_distance :: Fn2 Vec2 Vec2 Number

-- |Calculates the euclidian distance between two vec2's
distance :: Vec2 -> Vec2 -> Number
distance = runFn2 js_distance

foreign import js_divide :: Fn2 Vec2 Vec2 Vec2

-- |Divides two vec2's
divide :: Vec2 -> Vec2 -> Vec2
divide = runFn2 js_divide

foreign import js_dot :: Fn2 Vec2 Vec2 Number

-- |Calculates the dot product of two vec2's
dot :: Vec2 -> Vec2 -> Number
dot = runFn2 js_dot

foreign import js_epsilonEquals :: Fn2 Vec2 Vec2 Boolean

-- |Returns whether or not the vectors have approximately the same elements in the same position
epsilonEquals :: Vec2 -> Vec2 -> Boolean
epsilonEquals = runFn2 js_epsilonEquals

foreign import js_exactEquals :: Fn2 Vec2 Vec2 Boolean

-- |Returns whether or not the vectors exactly have the same elements in the same position (when compared with ===)
exactEquals :: Vec2 -> Vec2 -> Boolean
exactEquals = runFn2 js_exactEquals

foreign import js_floor :: Fn1 Vec2 Vec2

-- |Math.floor the components of a vec2
floor :: Vec2 -> Vec2
floor = runFn1 js_floor

foreign import js_fromValues :: Fn2 Number Number Vec2

-- |Creates a new vec2 initialized with the given values
fromValues :: Number -> Number -> Vec2
fromValues = runFn2 js_fromValues

foreign import js_inverse :: Fn1 Vec2 Vec2

-- |Returns the inverse of the components of a vec2
inverse :: Vec2 -> Vec2
inverse = runFn1 js_inverse

foreign import js_length :: Fn1 Vec2 Number

-- |Calculates the length of a vec2
length :: Vec2 -> Number
length = runFn1 js_length

foreign import js_lerp :: Fn3 Vec2 Vec2 Number Vec2

-- |Performs a linear interpolation between two vec2's
lerp :: Vec2 -> Vec2 -> Number -> Vec2
lerp = runFn3 js_lerp

foreign import js_max :: Fn2 Vec2 Vec2 Vec2

-- |Returns the maximum of two vec2's
max :: Vec2 -> Vec2 -> Vec2
max = runFn2 js_max

foreign import js_min :: Fn2 Vec2 Vec2 Vec2

-- |Returns the minimum of two vec2's
min :: Vec2 -> Vec2 -> Vec2
min = runFn2 js_min

foreign import js_multiply :: Fn2 Vec2 Vec2 Vec2

-- |Multiplies two vec2's
multiply :: Vec2 -> Vec2 -> Vec2
multiply = runFn2 js_multiply

foreign import js_negate :: Fn1 Vec2 Vec2

-- |Negates the components of a vec2
negate :: Vec2 -> Vec2
negate = runFn1 js_negate

foreign import js_normalize :: Fn1 Vec2 Vec2

-- |Normalize a vec2
normalize :: Vec2 -> Vec2
normalize = runFn1 js_normalize

foreign import js_rotate :: Fn3 Vec2 Vec2 Number Vec2

-- |Rotate a 2D vector
rotate :: Vec2 -> Vec2 -> Number -> Vec2
rotate = runFn3 js_rotate

foreign import js_round :: Fn1 Vec2 Vec2

-- |Math.round the components of a vec2
round :: Vec2 -> Vec2
round = runFn1 js_round

foreign import js_scale :: Fn2 Vec2 Number Vec2

-- |Scales a vec2 by a scalar number
scale :: Vec2 -> Number -> Vec2
scale = runFn2 js_scale

foreign import js_scaleAndAdd :: Fn3 Vec2 Vec2 Number Vec2

-- |Adds two vec2's after scaling the second operand by a scalar value
scaleAndAdd :: Vec2 -> Vec2 -> Number -> Vec2
scaleAndAdd = runFn3 js_scaleAndAdd

foreign import js_squaredDistance :: Fn2 Vec2 Vec2 Number

-- |Calculates the squared euclidian distance between two vec2's
squaredDistance :: Vec2 -> Vec2 -> Number
squaredDistance = runFn2 js_squaredDistance

foreign import js_squaredLength :: Fn1 Vec2 Number

-- |Calculates the squared length of a vec2
squaredLength :: Vec2 -> Number
squaredLength = runFn1 js_squaredLength

foreign import js_str :: Fn1 Vec2 String

-- |Returns a string representation of a vector
str :: Vec2 -> String
str = runFn1 js_str

foreign import js_subtract :: Fn2 Vec2 Vec2 Vec2

-- |Subtracts vector b from vector a
subtract :: Vec2 -> Vec2 -> Vec2
subtract = runFn2 js_subtract

-- TODO: (static) transformMat2d(out, a, m) → {vec2}
foreign import js_transformMat3 :: Fn2 Vec2 Mat3 Vec2

-- |Transforms the vec2 with a mat3 3rd vector component is implicitly '1'
transformMat3 :: Vec2 -> Mat3 -> Vec2
transformMat3 = runFn2 js_transformMat3

-- TODO: (static) transformMat4(out, a, m) → {vec2}
foreign import js_zero :: Fn0 Vec2

zero :: Vec2
zero = runFn0 js_zero

foreign import js_numbers :: Fn1 Vec2 (Array Number)

-- |Extract a number array
numbers :: Vec2 -> Array Number
numbers = runFn1 js_numbers

-- |Create a vector from an array produced by `numbers`.
unsafeFromNumbers :: Partial => Array Number -> Vec2
unsafeFromNumbers [ x, y ] = fromValues x y

instance showVec2 :: Prelude.Show Vec2 where
  show = str

instance eqVec2 :: Prelude.Eq Vec2 where
  eq = exactEquals

-- |Map a function from `Number` to `Number` over it.
-- |Note: Since this is not a general container, it cannot be a `Functor`.
map :: (Number -> Number) -> Vec2 -> Vec2
map fn v = unsafePartial $ unsafeFromNumbers $ Prelude.map fn $ numbers v

zipWith :: (Number -> Number -> Number) -> Vec2 -> Vec2 -> Vec2
zipWith fn v1 v2 = unsafePartial $ unsafeFromNumbers $ Array.zipWith fn (numbers v1) (numbers v2)
