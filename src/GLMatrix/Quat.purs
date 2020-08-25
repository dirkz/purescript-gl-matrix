module GLMatrix.Quat where

import Data.Function.Uncurried (Fn1, Fn2, Fn4, Fn5, runFn1, runFn2, runFn4, runFn5)

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
