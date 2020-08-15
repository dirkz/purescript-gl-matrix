module GLMatrix where

import Prelude
import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

foreign import js_epsilonEquals :: Fn2 Number Number Boolean

-- |Tests whether or not the arguments have approximately the same value, within an absolute or relative tolerance of glMatrix.EPSILON (an absolute tolerance is used for values less than or equal to 1.0, and a relative tolerance is used for larger values)
epsilonEquals :: Number -> Number -> Boolean
epsilonEquals = runFn2 js_epsilonEquals

foreign import js_setMatrixArrayTypeToArray :: EffectFn1 Unit Unit

-- |glMatrix supports both `Number` `Array`s and `Float32Array`s internally,
-- |but this library assumes the former, so this function must be called before
-- |using the library.
setMatrixArrayTypeToArray :: Effect Unit
setMatrixArrayTypeToArray = runEffectFn1 js_setMatrixArrayTypeToArray unit

foreign import js_toRadian :: Fn1 Number Number

-- |Convert Degree To Radian
toRadian :: Number -> Number
toRadian = runFn1 js_toRadian
