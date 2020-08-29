module Test.TestVec3 where

import Test.Arbitrary

import Data.Array (zipWith)
import Data.Foldable (sum)
import Effect (Effect)
import GLMatrix (equalArrays, toRadian)
import GLMatrix as GLMatrix
import GLMatrix.Mat3 as Mat3
import GLMatrix.Mat4.Mix as Mat4
import GLMatrix.Quat as Quat
import GLMatrix.Vec3 (Vec3, add, angle, bezier, ceil, cross, distance, divide, dot, equals, floor, hermite, inverse, length, lerp, max, min, multiply, negate, normalize, numbers, rotateX, rotateY, rotateZ, round, scale, scaleAndAdd, squaredDistance, squaredLength, subtract, zero)
import GLMatrix.Vec3 as Vec
import GLMatrix.Vec3 as Vec3
import GLMatrix.Vec3.Mix (transformMat3, transformMat4, transformQuat)
import Math as Math
import Prelude (Unit, discard, map, show, ($), (&&), (*), (/), (/=), (<>), (==))
import Prelude as Prelude
import Test.QuickCheck (quickCheck, (<?>))

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbVec3 v) ->
    let
      v1 = add v v

      v2 = scale v 2.0
    in
      equals v1 v2 <?> "testAdd " <> show v

testAngleSame :: Effect Unit
testAngleSame =
  quickCheck \(ArbVec3 v) ->
    GLMatrix.equals (angle v v) 0.0 <?> "testAngleSame " <> show v

testAngle :: Effect Unit
testAngle =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) ->
    let
      a1 = angleViaDotProduct v1 v2

      a2 = angle v1 v2
    in
      GLMatrix.equals a1 a2 <?> "testAngle " <> show v1 <> " " <> show v2 <> " a1:" <> show a1 <> " a2:" <> show a2
  where
  angleViaDotProduct :: Vec3 -> Vec3 -> Number
  angleViaDotProduct v1 v2 =
    let
      dotP = dot v1 v2

      len1 = length v1

      len2 = length v2
    in
      Math.acos $ dotP / (len1 * len2)

testCeil :: Effect Unit
testCeil =
  quickCheck \(ArbVec3 v) ->
    let
      ceil1 :: Array Number
      ceil1 = numbers $ ceil v

      ceil2 :: Array Number
      ceil2 = map Math.ceil (numbers v)
    in
      equalArrays ceil1 ceil2 <?> "testCeil " <> show v

testCross :: Effect Unit
testCross =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) ->
    let
      r1 = cross v1 v2

      d1 = dot v1 r1

      d2 = dot v2 r1
    in
      GLMatrix.equals d1 0.0 && GLMatrix.equals d2 0.0 <?> "testCross " <> show v1 <> " " <> show v2 <> " r1: " <> show r1 <> " d1: " <> show d1 <> " d2: " <> show d2

testDistance :: Effect Unit
testDistance =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) ->
    let
      d1 :: Number
      d1 = distance v1 v2

      d2 :: Number
      d2 = length $ subtract v1 v2
    in
      GLMatrix.equals d1 d2 <?> "testDistance " <> show v1 <> " " <> show v2

testDivide :: Effect Unit
testDivide =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) ->
    let
      v = divide v1 v2

      divided = zipWith (/) (numbers v1) (numbers v2)
    in
      equalArrays divided (numbers v) <?> "testDivide " <> show v1 <> " " <> show v2

testEquals :: Effect Unit
testEquals =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) ->
    let
      v3 = add v1 v2
    in
      v3 /= v1 <?> "testEquals " <> show v1 <> " " <> show v2

testFloor :: Effect Unit
testFloor =
  quickCheck \(ArbVec3 v) ->
    let
      floor1 :: Array Number
      floor1 = numbers $ floor v

      floor2 :: Array Number
      floor2 = map Math.floor (numbers v)
    in
      equalArrays floor1 floor2 <?> "testFloor " <> show v

testInverse :: Effect Unit
testInverse =
  quickCheck \(ArbVec3 v) ->
    let
      v1 = inverse v

      v2 = Vec3.map (\n -> 1.0 / n) v
    in
      v1 == v2 <?> "testInverse " <> show v <> " -> " <> show (inverse v)

testLength :: Effect Unit
testLength =
  quickCheck \(ArbVec3 v) ->
    GLMatrix.equals (length v) (manualLength v) <?> "testLength " <> show v <> " -> " <> show (manualLength v)
  where
  manualLength v = Math.sqrt $ sum $ map (\n -> n * n) (numbers v)

testLerpDouble :: Effect Unit
testLerpDouble =
  quickCheck \(ArbVec3 v) ->
    let
      vDouble = scale v 2.0
    in
      equals (lerp v vDouble 1.0) vDouble <?> "testLerpDouble " <> show v

testLerpOriginal :: Effect Unit
testLerpOriginal =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) ->
    equals (lerp v1 v2 0.0) v1 <?> "testLerpOriginal " <> show v1 <> " " <> show v2

testLerpDifferent :: Effect Unit
testLerpDifferent =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) ->
    equals (lerp v1 v2 1.0) v2 <?> "testLerpDifferent " <> show v1 <> " " <> show v2

testMaxDouble :: Effect Unit
testMaxDouble =
  quickCheck \(ArbVec3 v) ->
    let
      vDouble = scale v 2.0
    in
      equals (max v vDouble) vDouble <?> "testMaxDouble " <> show v

testMinDouble :: Effect Unit
testMinDouble =
  quickCheck \(ArbVec3 v) ->
    let
      vDouble = scale v 2.0
    in
      equals (min v vDouble) v <?> "testMinDouble " <> show v

testMultiply :: Effect Unit
testMultiply =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) ->
    let
      r1 = multiply v1 v2

      r2 = Vec.zipWith (*) v1 v2
    in
      equals r1 r2 <?> "testMultiply " <> show v1 <> " " <> show v2

testNegate :: Effect Unit
testNegate =
  quickCheck \(ArbVec3 v) ->
    let
      r1 = negate v

      r2 = Vec.map Prelude.negate v
    in
      equals r1 r2 <?> "testNegate " <> show v

testNormalize :: Effect Unit
testNormalize =
  quickCheck \(ArbVec3 v) ->
    let
      r1 = normalize v

      len = length v

      r2 = scale v (1.0 / len)
    in
      equals r1 r2 <?> "testNormalize " <> show v

testRotateX :: Effect Unit
testRotateX =
  quickCheck \(ArbVec3 v) r ->
    let
      r1 = rotateX v zero r

      r2 = transformMat3 v (Mat3.rotationX r)
    in
      equals r1 r2 <?> "testRotateX " <> show v <> " " <> show r

testRotateY :: Effect Unit
testRotateY =
  quickCheck \(ArbVec3 v) r ->
    let
      r1 = rotateY v zero r

      r2 = transformMat3 v (Mat3.rotationY r)
    in
      equals r1 r2 <?> "testRotateY " <> show v <> " " <> show r

testRotateZ :: Effect Unit
testRotateZ =
  quickCheck \(ArbVec3 v) r ->
    let
      r1 = rotateZ v zero r

      r2 = transformMat3 v (Mat3.rotationZ r)
    in
      equals r1 r2 <?> "testRotateZ " <> show v <> " " <> show r

testRound :: Effect Unit
testRound =
  quickCheck \(ArbVec3 v) ->
    let
      round1 :: Array Number
      round1 = numbers $ round v

      round2 :: Array Number
      round2 = map Math.round (numbers v)
    in
      equalArrays round1 round2 <?> "testRound " <> show v

testScaleAndAdd :: Effect Unit
testScaleAndAdd =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) s ->
    let
      r1 = scaleAndAdd v1 v2 s

      r2 = add v1 (scale v2 s)
    in
      equals r1 r2 <?> "testScaleAndAdd " <> show v1 <> " " <> show v2 <> " " <> show s

testSquaredDistance :: Effect Unit
testSquaredDistance =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) ->
    let
      r1 = squaredDistance v1 v2

      d = distance v1 v2

      r2 = d * d
    in
      GLMatrix.equals r1 r2 <?> "testSquaredDistance " <> show v1 <> " " <> show v2

testSquaredLength :: Effect Unit
testSquaredLength =
  quickCheck \(ArbVec3 v) ->
    let
      r1 = squaredLength v

      l = length v

      r2 = l * l
    in
      GLMatrix.equals r1 r2 <?> "testSquaredLength " <> show v

testSubtract :: Effect Unit
testSubtract =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) ->
    let
      r1 = subtract v1 v2

      r2 = add v1 (negate v2)
    in
      equals r1 r2 <?> "testSubtract " <> show v1 <> " " <> show v2

testZero :: Effect Unit
testZero =
  quickCheck \r ->
    let
      v = zero

      r1 = scale v r
    in
      equals r1 v <?> "testZero " <> show r

testBezierOriginal :: Effect Unit
testBezierOriginal =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) (ArbVec3 v3) (ArbVec3 v4) ->
    equals (bezier v1 v2 v3 v4 0.0) v1
      <?> "testBezierOriginal"

testBezierEnd :: Effect Unit
testBezierEnd =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) (ArbVec3 v3) (ArbVec3 v4) ->
    equals (bezier v1 v2 v3 v4 1.0) v4
      <?> "testBezierEnd"

testHermiteOriginal :: Effect Unit
testHermiteOriginal =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) (ArbVec3 v3) (ArbVec3 v4) ->
    equals (hermite v1 v2 v3 v4 0.0) v1
      <?> "testHermiteOriginal"

testHermiteEnd :: Effect Unit
testHermiteEnd =
  quickCheck \(ArbVec3 v1) (ArbVec3 v2) (ArbVec3 v3) (ArbVec3 v4) ->
    equals (hermite v1 v2 v3 v4 1.0) v4
      <?> "testHermiteEnd"

testTransformQuat :: Effect Unit
testTransformQuat =
  quickCheck \(ArbVec3 v) d ->
    let
      r1 = rotateX v zero (toRadian d)

      q = Quat.fromEuler d 0.0 0.0

      r2 = transformQuat v q
    in
      equals r1 r2 <?> "testTransformQuat " <> show v <> " " <> show d

testTransformMat4 :: Effect Unit
testTransformMat4 =
  quickCheck \(ArbVec3 v) d ->
    let
      r1 = rotateX v zero (toRadian d)

      q = Quat.fromEuler d 0.0 0.0

      r2 = transformQuat v q

      m = Mat4.fromQuat q

      r3 = transformMat4 v m
    in
      equals r1 r2 && equals r1 r3 <?> "testTransformMat4 " <> show v <> " " <> show d

main :: Effect Unit
main = do
  testAdd
  testAngleSame
  testAngle
  testCeil
  testCross
  testDistance
  testDivide
  testEquals
  testFloor
  testInverse
  testLength
  testLerpDouble
  testLerpOriginal
  testLerpDifferent
  testMaxDouble
  testMinDouble
  testMultiply
  testNegate
  testNormalize
  testRotateX
  testRotateY
  testRotateZ
  testRound
  testScaleAndAdd
  testSquaredDistance
  testSquaredLength
  testSubtract
  testZero
  testBezierOriginal
  testBezierEnd
  testHermiteOriginal
  testHermiteEnd
  testTransformQuat
  testTransformMat4
