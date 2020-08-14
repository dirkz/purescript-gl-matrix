module GLMatrix.Vec2 where
  
import Prelude
import Data.Function.Uncurried (Fn0, Fn1, Fn2, Fn3, Fn4, runFn0, runFn1, runFn2, runFn3, runFn4)

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

-- TODO: (static) cross(out, a, b) → {vec3}

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

foreign import js_equals :: Fn2 Vec2 Vec2 Boolean

-- |Returns whether or not the vectors have approximately the same elements in the same position
equals :: Vec2 -> Vec2 -> Boolean
equals = runFn2 js_equals

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
