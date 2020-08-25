module GLMatrix.Quat where

import Data.Function.Uncurried (Fn0, Fn1, Fn2, Fn3, Fn4, Fn5, runFn0, runFn1, runFn2, runFn3, runFn4, runFn5)

foreign import data Quat :: Type

foreign import js_equals :: Fn2 Quat Quat Boolean

-- |Returns whether or not the quaternions have approximately the same elements in the same position.
equals :: Quat -> Quat -> Boolean
equals = runFn2 js_equals

foreign import js_exactEquals :: Fn2 Quat Quat Boolean

-- |Returns whether or not the quaternions have exactly the same elements in the same position (when compared with ===)
exactEquals :: Quat -> Quat -> Boolean
exactEquals = runFn2 js_exactEquals

foreign import js_length :: Fn1 Quat Number

-- |Calculates the length of a quat
length :: Quat -> Number
length = runFn1 js_length

foreign import js_sqlerp :: Fn5 Quat Quat Quat Quat Number Quat

-- |Sets the specified quaternion with values corresponding to the given axes. Each axis is a vec3 and is expected to be unit length and perpendicular to all other specified axes.
sqlerp :: Quat -> Quat -> Quat -> Quat -> Number -> Quat
sqlerp = runFn5 js_sqlerp

foreign import js_add :: Fn2 Quat Quat Quat

-- |Adds two quat's
add :: Quat -> Quat -> Quat
add = runFn2 js_add

foreign import js_calculateW :: Fn1 Quat Quat

-- |Calculates the W component of a quat from the X, Y, and Z components. Assumes that quaternion is 1 unit in length. Any existing W component will be ignored.
calculateW :: Quat -> Quat
calculateW = runFn1 js_calculateW

foreign import js_conjugate :: Fn1 Quat Quat

-- |Calculates the conjugate of a quat If the quaternion is normalized, this function is faster than quat.inverse and produces the same result.
conjugate :: Quat -> Quat
conjugate = runFn1 js_conjugate

foreign import js_dot :: Fn2 Quat Quat Quat

-- |Calculates the dot product of two quat's
dot :: Quat -> Quat -> Quat
dot = runFn2 js_dot

foreign import js_exp :: Fn1 Quat Quat

-- |Calculate the exponential of a unit quaternion.
exp :: Quat -> Quat
exp = runFn1 js_exp

foreign import js_fromEuler :: Fn3 Number Number Number Quat

-- |Creates a quaternion from the given euler angle x, y, z.
fromEuler :: Number -> Number -> Number -> Quat
fromEuler = runFn3 js_fromEuler

foreign import js_fromValues :: Fn4 Number Number Number Number Quat

-- |Creates a new quat initialized with the given values
fromValues :: Number -> Number -> Number -> Number -> Quat
fromValues = runFn4 js_fromValues

foreign import js_getAngle :: Fn2 Quat Quat Number

-- |Gets the angular distance between two unit quaternions
getAngle :: Quat -> Quat -> Number
getAngle = runFn2 js_getAngle

foreign import js_identity :: Fn0 Quat

-- |Gets the angular distance between two unit quaternions
identity :: Quat
identity = runFn0 js_identity

foreign import js_invert :: Fn1 Quat Quat

-- |Calculates the inverse of a quat
invert :: Quat -> Quat
invert = runFn1 js_invert

foreign import js_lerp :: Fn3 Quat Quat Number Quat

-- |Performs a linear interpolation between two quat's
lerp :: Quat -> Quat -> Number -> Quat
lerp = runFn3 js_lerp

foreign import js_ln :: Fn1 Quat Quat

-- |Calculate the natural logarithm of a unit quaternion.
ln :: Quat -> Quat
ln = runFn1 js_ln

foreign import js_multiply :: Fn2 Quat Quat Quat

-- |Multiplies two quat's
multiply :: Quat -> Quat -> Quat
multiply = runFn2 js_multiply

foreign import js_normalize :: Fn1 Quat Quat

-- |Normalize a quat
normalize :: Quat -> Quat
normalize = runFn1 js_normalize

foreign import js_pow :: Fn1 Quat Number

-- |Calculate the scalar power of a unit quaternion.
pow :: Quat -> Number
pow = runFn1 js_pow

foreign import js_rotateX :: Fn2 Quat Number Quat

-- |Rotates a quaternion by the given angle about the X axis
rotateX :: Quat -> Number -> Quat
rotateX = runFn2 js_rotateX

