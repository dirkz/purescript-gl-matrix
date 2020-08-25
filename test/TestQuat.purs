module Test.TestQuat where

import Test.Arbitrary

import Effect (Effect)
import GLMatrix.Quat (add, conjugate, equals, invert, lerp, normalize)
import GLMatrix.Quat.Mix (getAxisAngle, setAxisAngle)
import Prelude (Unit, discard, show, (&&), (<>), (==))
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

testGetAxisAngle :: Effect Unit
testGetAxisAngle =
  quickCheck \(ArbVec3 v) r ->
    let
      q1 = setAxisAngle v r

      r2 = getAxisAngle v q1
    in
      r == r2 <?> "testGetAxisAngle " <> show v <> " " <> show r

testLerp :: Effect Unit
testLerp =
  quickCheck \(ArbQuat q1) (ArbQuat q2) ->
    let
      r1 = lerp q1 q2 0.0

      r2 = lerp q1 q2 1.0
    in
      equals r1 q1 && equals r2 q2 <?> "testLerp " <> show q1 <> " " <> show q2

main :: Effect Unit
main = do
  testAdd
  testConjugate
  testGetAxisAngle
  testLerp
