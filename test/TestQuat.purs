module Test.TestQuat where

import Test.Arbitrary
import Effect (Effect)
import GLMatrix (toRadian)
import GLMatrix as GLMatrix
import GLMatrix.Quat (Quat, add, all, conjugate, equals, exp, fromEuler, fromValues, identity, invert, length, lerp, ln, multiply, normalize, numbers, pow, rotateX, rotateY, rotateZ, scale, slerp, subtract, unsafeFromNumbers)
import GLMatrix.Quat.Mix (getAxisAngle, setAxisAngle)
import GLMatrix.Vec4 (Vec4)
import GLMatrix.Vec4 as Vec4
import Math as Math
import Partial.Unsafe (unsafePartial)
import Prelude (Unit, discard, show, ($), (&&), (-), (<), (<>), (==))
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
      equals (conjugate n) (invert n) <?> "testConjugate " <> show q

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

testPow :: Effect Unit
testPow =
  quickCheck \(ArbQuat q) s ->
    let
      q1 = ln q

      q2 = scale q1 s

      q3 = exp q2

      q4 = pow q s
    in
      equals q3 q4 <?> "testPow " <> show q3 <> " " <> show q4

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

testRotateX :: Effect Unit
testRotateX =
  quickCheck \d ->
    let
      q1 = fromEuler d 0.0 0.0

      q2 = rotateX identity (toRadian d)
    in
      equals q1 q2 <?> "testEuler " <> show q1 <> " " <> show q2

testRotateY :: Effect Unit
testRotateY =
  quickCheck \d ->
    let
      q1 = fromEuler 0.0 d 0.0

      q2 = rotateY identity (toRadian d)
    in
      equals q1 q2 <?> "testRotateY " <> show q1 <> " " <> show q2

testRotateZ :: Effect Unit
testRotateZ =
  quickCheck \d ->
    let
      q1 = fromEuler 0.0 0.0 d

      q2 = rotateZ identity (toRadian d)
    in
      equals q1 q2 <?> "testRotateZ " <> show q1 <> " " <> show q2

testFromNumbers :: Effect Unit
testFromNumbers =
  quickCheck \x y z w ->
    let
      q1 = fromValues x y z w

      q2 = unsafePartial $ unsafeFromNumbers [ x, y, z, w ]

      n1 = numbers q1

      n2 = numbers q2
    in
      q1 == q2 && n1 == n2 && GLMatrix.equalArrays n1 [ x, y, z, w ]
        <?> "testFromNumbers "
        <> show q1
        <> " "
        <> show q2

testEulerVsChainedRotates :: Effect Unit
testEulerVsChainedRotates =
  quickCheck \dx dy dz ->
    let
      q1 = fromEuler dx dy dz

      qt1 = rotateX identity (toRadian dx)

      qt2 = rotateY identity (toRadian dy)

      q2 = rotateZ identity (toRadian dz)

      qDiff = subtract q1 q2

      maxDev = 0.01
    in
      all (\n -> Math.abs n < maxDev) qDiff <?> "testEulerVsChainedRotates "
        <> show q1
        <> " "
        <> show q2
        <> " "
        <> show qDiff

testEulerVsMultipliedRotates :: Effect Unit
testEulerVsMultipliedRotates =
  quickCheck \dx dy dz ->
    let
      q1 = fromEuler dx dy dz

      qtx = rotateX identity (toRadian dx)

      qty = rotateY identity (toRadian dy)

      qtz = rotateZ identity (toRadian dz)

      qtm = multiply qtx qty

      q2 = multiply qtm qtz

      qDiff = subtract q1 q2

      maxDev = 0.001
    in
      all (\n -> Math.abs n < maxDev) qDiff <?> "testEulerVsMultipliedRotates "
        <> show q1
        <> " "
        <> show q2

main :: Effect Unit
main = do
  testAdd
  testConjugate
  testGetAxisAngle
  testLerp lerp
  testLerp slerp
  testPow
  testLength
  testRotateX
  testRotateY
  testRotateZ
  testFromNumbers
  testEulerVsChainedRotates
  testEulerVsMultipliedRotates
