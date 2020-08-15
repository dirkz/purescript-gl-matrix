module Test.TestVec2 where

import Effect (Effect)
import GLMatrix (epsilonEqualArrays)
import GLMatrix as GLMatrix
import GLMatrix.Vec2 (Vec2, add, angle, ceil, epsilonEquals, fromValues, numbers, scale)
import Math as Math
import Prelude (Unit, discard, map, ($), (<$>), (<*>))
import Test.QuickCheck (class Arbitrary, arbitrary, quickCheck)

newtype ArbVec2
  = ArbVec2 Vec2

instance arbVec2 :: Arbitrary ArbVec2 where
  arbitrary = ArbVec2 <$> (fromValues <$> arbitrary <*> arbitrary)

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbVec2 v) ->
    let
      v1 = add v v

      v2 = scale v 2.0
    in
      epsilonEquals v1 v2

testAngleSame :: Effect Unit
testAngleSame = quickCheck \(ArbVec2 v) -> GLMatrix.epsilonEquals (angle v v) 0.0

testCeil :: Effect Unit
testCeil =
  quickCheck \x y ->
    let
      v = fromValues x y

      ceil1 :: Array Number
      ceil1 = numbers $ ceil v

      ceil2 :: Array Number
      ceil2 = map Math.ceil [ x, y ]
    in
      epsilonEqualArrays ceil1 ceil2

main :: Effect Unit
main = do
  testAdd
  testAngleSame
  testCeil
