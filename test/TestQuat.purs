module Test.TestQuat where

import Test.Arbitrary
import Effect (Effect)
import GLMatrix.Quat (add, calculateW, conjugate, fromValues, invert, normalize)
import Prelude (Unit, show, (<>), (==), discard)
import Test.QuickCheck (quickCheck, (<?>))

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbQuat q1) (ArbQuat q2) ->
    add q1 q2 == add q2 q1 <?> "testAdd " <> show q1 <> " " <> show q2

testConjugate :: Effect Unit
testConjugate =
  quickCheck \(ArbQuat q) ->
    let
      n = normalize q
    in
      conjugate n == invert n <?> "testConjugate " <> show q

testCalculateW :: Effect Unit
testCalculateW =
  quickCheck \x y z w ->
    let
      q = fromValues x y z w
    in
      calculateW q == w <?> "testCalculateW " <> show [ x, y, z, w ]

main :: Effect Unit
main = do
  testAdd
  testConjugate
  testCalculateW
