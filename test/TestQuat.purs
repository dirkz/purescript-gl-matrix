module Test.TestQuat where

import Test.Arbitrary
import Effect (Effect)
import GLMatrix.Quat (add, conjugate, invert, normalize)
import Prelude (Unit, show, (<>), (==), discard)
import Test.QuickCheck (quickCheck, (<?>))

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbQuat q1) (ArbQuat q2) ->
    add q1 q2 == add q2 q1 <?> "testAdd " <> show q1 <> " " <> show q2

testConjugate :: Effect Unit
testConjugate =
  quickCheck \(ArbQuat q1) ->
    let
      n1 = normalize q1
    in
      conjugate n1 == invert n1 <?> "testConjugate " <> show q1

main :: Effect Unit
main = do
  testAdd
  testConjugate
