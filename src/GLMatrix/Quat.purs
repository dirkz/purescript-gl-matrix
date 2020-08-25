module GLMatrix.Quat where

import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)

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
