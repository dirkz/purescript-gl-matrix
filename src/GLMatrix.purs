module GLMatrix
  ( MatrixArrayType
  , equals
  , setMatrixArrayTypeArray
  , setMatrixArrayTypeFloat32Array
  , setMatrixArrayType
  , toRadian
  , equalArrays
  ) where

import Prelude
import Data.Array (zipWith)
import Data.Foldable (and)
import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

foreign import js_equals :: Fn2 Number Number Boolean

-- |Tests whether or not the arguments have approximately the same value, within an absolute or relative tolerance of glMatrix.EPSILON (an absolute tolerance is used for values less than or equal to 1.0, and a relative tolerance is used for larger values)
equals :: Number -> Number -> Boolean
equals = runFn2 js_equals

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

-- |Uses `equal` to check that all numbers in the given arrays are approximately the same.
equalArrays :: Array Number -> Array Number -> Boolean
equalArrays ns1 ns2 = and $ zipWith equals ns1 ns2
