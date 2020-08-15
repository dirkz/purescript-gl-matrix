module GLMatrix where

import Prelude
import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

foreign import js_equalsEpsilon :: Fn2 Number Number Boolean

-- |Tests whether or not the arguments have approximately the same value, within an absolute or relative tolerance of glMatrix.EPSILON (an absolute tolerance is used for values less than or equal to 1.0, and a relative tolerance is used for larger values)
equalsEpsilon :: Number -> Number -> Boolean
equalsEpsilon = runFn2 js_equalsEpsilon

data MatrixArrayType
  = MatrixArrayTypeArray
  | MatrixArrayTypeFloat32Array

foreign import js_setMatrixArrayTypeArray :: EffectFn1 Unit Unit

-- |Sets the type of array used when creating new vectors and matrices
setMatrixArrayTypeArray :: Unit -> Effect Unit
setMatrixArrayTypeArray = runEffectFn1 js_setMatrixArrayTypeArray

foreign import js_setMatrixArrayTypeFloat32Array :: EffectFn1 Unit Unit

-- |Sets the type of array used when creating new vectors and matrices
setMatrixArrayTypeFloat32Array :: Unit -> Effect Unit
setMatrixArrayTypeFloat32Array = runEffectFn1 js_setMatrixArrayTypeFloat32Array

setMatrixArrayType :: MatrixArrayType -> Effect Unit
setMatrixArrayType MatrixArrayTypeArray = runEffectFn1 js_setMatrixArrayTypeArray unit
setMatrixArrayType MatrixArrayTypeFloat32Array = runEffectFn1 js_setMatrixArrayTypeFloat32Array unit

foreign import js_toRadian :: Fn1 Number Number

-- |Convert Degree To Radian
toRadian :: Number -> Number
toRadian = runFn1 js_toRadian
