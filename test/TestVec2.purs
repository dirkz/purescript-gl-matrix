module Test.TestVec2 where

import Effect (Effect)
import GLMatrix as GLMatrix
import GLMatrix.Vec2 (Vec2, add, angle, epsilonEquals, fromValues, scale)
import Prelude (Unit, (<$>), (<*>), discard)
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

main :: Effect Unit
main = do
  testAdd
  testAngleSame
