module Test.TestQuat where

import Test.Arbitrary
import Effect (Effect)
import GLMatrix.Quat (add)
import Prelude (Unit, show, (<>), (==))
import Test.QuickCheck (quickCheck, (<?>))

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbQuat q1) (ArbQuat q2) ->
    add q1 q2 == add q2 q1 <?> "testAdd " <> show q1 <> " " <> show q2

main :: Effect Unit
main = do
  testAdd
