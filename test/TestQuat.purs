module Test.TestQuat where

import Test.Arbitrary
import Data.Array (unsafeIndex)
import Effect (Effect)
import GLMatrix.Mat3 as Mat3
import GLMatrix.Quat (Quat, add, conjugate, equals, exp, getAngle, invert, length, lerp, ln, normalize, numbers, scale, slerp)
import GLMatrix.Quat.Mix (fromMat3, getAxisAngle, setAxes, setAxisAngle)
import GLMatrix.Vec3 (Vec3)
import GLMatrix.Vec3 as Vec3
import GLMatrix.Vec4 (Vec4)
import GLMatrix.Vec4 as Vec4
import Math as Math
import Partial.Unsafe (unsafePartial)
import Prelude (Unit, discard, negate, show, ($), (&&), (-), (<), (<>), (==))
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
  quickCheck \(ArbVec3 v) r1 ->
    let
      q1 = setAxisAngle v r1

      r2 = getAxisAngle v q1
    in
      Math.abs (r1 - r2) < maxAllowedDiff <?> "testGetAxisAngle " <> show r1 <> " " <> show r2
  where
  maxAllowedDiff = 0.001

testLerp :: (Quat -> Quat -> Number -> Quat) -> Effect Unit
testLerp fn =
  quickCheck \(ArbQuat q1) (ArbQuat q2) ->
    let
      r1 = fn q1 q2 0.0

      r2 = fn q1 q2 1.0
    in
      equals r1 q1 && equals r2 q2 <?> "testLerp " <> show q1 <> " " <> show q2

testGetAngle :: Effect Unit
testGetAngle =
  quickCheck \(ArbQuat q) ->
    let
      q1 = normalize q
    in
      getAngle q q == 0.0 <?> "testGetAngle " <> show q

testPow :: Effect Unit
testPow =
  quickCheck \(ArbQuat q) s ->
    let
      q1 = ln q

      q2 = scale q1 s

      q3 = exp q2
    in
      equals q3 q <?> "testPow " <> show q <> " " <> show q3

vec4FromQuat :: Quat -> Vec4
vec4FromQuat q = unsafePartial $ Vec4.unsafeFromNumbers $ numbers q

testLength :: Effect Unit
testLength =
  quickCheck \(ArbQuat q) ->
    let
      v = vec4FromQuat q

      l1 = length q

      l2 = Vec4.length v
    in
      l1 == l2 <?> "testLength " <> show q <> " " <> show v

mySetAxes :: Vec3 -> Vec3 -> Vec3 -> Quat
mySetAxes right up view =
  let
    nright = Vec3.numbers right

    nup = Vec3.numbers up

    nview = Vec3.numbers view

    m =
      Mat3.fromValues
        (ind nright 0)
        (ind nup 0)
        (-(ind nview 0))
        (ind nright 1)
        (ind nup 1)
        (-(ind nview 1))
        (ind nright 2)
        (ind nup 2)
        (-(ind nview 2))
  in
    normalize $ fromMat3 m
  where
  ind ar i = unsafePartial $ unsafeIndex ar i

testSetAxes :: Effect Unit
testSetAxes =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) (ArbVec3 v3) ->
    let
      r1 = setAxes v1 v2 v3

      r2 = mySetAxes v1 v2 v3
    in
      equals r1 r2 <?> "testSetAxes " <> show r1 <> " " <> show r2

main :: Effect Unit
main = do
  testAdd
  testConjugate
  testGetAxisAngle
  testLerp lerp
  testLerp slerp
  testGetAngle
  testPow
  testLength
  testSetAxes
