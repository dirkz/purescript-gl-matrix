module Test.TestQuat where

import Test.Arbitrary
import Data.Array (zipWith)
import Data.Foldable (sum)
import Effect (Effect)
import GLMatrix (equalArrays)
import GLMatrix as GLMatrix
import GLMatrix.Vec4 (add, ceil, distance, divide, equals, floor, inverse, length, lerp, max, min, multiply, negate, normalize, numbers, round, scale, scaleAndAdd, squaredDistance, squaredLength, subtract, zero)
import GLMatrix.Vec4 as Vec
import GLMatrix.Vec4 as Vec4
import Math as Math
import Prelude (Unit, discard, map, show, ($), (*), (/), (/=), (<>), (==))
import Prelude as Prelude
import Test.QuickCheck (quickCheck, (<?>))

main :: Effect Unit
main = do
  testAdd
