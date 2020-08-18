module Test.TestVec2 where

import Test.Arbitrary
import Data.Array (zipWith)
import Data.Foldable (sum)
import Effect (Effect)
import GLMatrix (epsilonEqualArrays)
import GLMatrix as GLMatrix
import GLMatrix.Mat2 as Mat2
import GLMatrix.Mat3 as Mat3
import GLMatrix.MatVec2 (transformMat2)
import GLMatrix.Vec2 (Vec2, add, angle, ceil, cross, distance, divide, dot, epsilonEquals, floor, inverse, length, lerp, max, min, multiply, negate, normalize, numbers, rotate, round, scale, scaleAndAdd, squaredDistance, squaredLength, subtract, transformMat3, zero)
import GLMatrix.Vec2 as Vec2
import GLMatrix.Vec3 as Vec3
import Math as Math
import Partial.Unsafe (unsafePartial)
import Prelude (Unit, discard, map, show, ($), (&&), (*), (/), (/=), (<>), (==))
import Prelude as Prelude
import Test.QuickCheck (quickCheck, (<?>))

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbVec2 v) ->
    let
      v1 = add v v

      v2 = scale v 2.0
    in
      epsilonEquals v1 v2 <?> "testAdd " <> show v

testAngleSame :: Effect Unit
testAngleSame =
  quickCheck \(ArbVec2 v) ->
    GLMatrix.epsilonEquals (angle v v) 0.0 <?> "testAngleSame " <> show v

testAngle :: Effect Unit
testAngle =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) ->
    let
      a1 = angleViaDotProduct v1 v2

      a2 = angle v1 v2
    in
      GLMatrix.epsilonEquals a1 a2 <?> "testAngle " <> show v1 <> " " <> show v2 <> " a1:" <> show a1 <> " a2:" <> show a2
  where
  angleViaDotProduct :: Vec2 -> Vec2 -> Number
  angleViaDotProduct v1 v2 =
    let
      dotP = dot v1 v2

      len1 = length v1

      len2 = length v2
    in
      Math.acos $ dotP / (len1 * len2)

testCeil :: Effect Unit
testCeil =
  quickCheck \(ArbVec2 v) ->
    let
      ceil1 :: Array Number
      ceil1 = numbers $ ceil v

      ceil2 :: Array Number
      ceil2 = map Math.ceil (numbers v)
    in
      epsilonEqualArrays ceil1 ceil2 <?> "testCeil " <> show v

vec3FromVec2 :: Vec2 -> Vec3.Vec3
vec3FromVec2 v = unsafePartial $ Vec3.unsafeFromNumbers $ extendArray $ numbers v
  where
  extendArray :: Partial => Array Number -> Array Number
  extendArray [ x, y ] = [ x, y, 0.0 ]

testCross :: Effect Unit
testCross =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) ->
    let
      r1 = cross v1 v2

      d1 = Vec3.dot (vec3FromVec2 v1) r1

      d2 = Vec3.dot (vec3FromVec2 v2) r1
    in
      GLMatrix.epsilonEquals d1 0.0 && GLMatrix.epsilonEquals d2 0.0 <?> "testCross " <> show v1 <> " " <> show v2 <> " d1: " <> show d1 <> " d2: " <> show d2 <> " (vec3FromVec2 v1) " <> show (vec3FromVec2 v1)

testDistance :: Effect Unit
testDistance =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) ->
    let
      d1 :: Number
      d1 = distance v1 v2

      d2 :: Number
      d2 = length $ subtract v1 v2
    in
      GLMatrix.epsilonEquals d1 d2 <?> "testDistance " <> show v1 <> ", " <> show v2

testDivide :: Effect Unit
testDivide =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) ->
    let
      v = divide v1 v2

      divided = zipWith (/) (numbers v1) (numbers v2)
    in
      epsilonEqualArrays divided (numbers v) <?> "testDivide " <> show v1 <> ", " <> show v2

testEquals :: Effect Unit
testEquals =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) ->
    let
      v3 = add v1 v2
    in
      v3 /= v1 <?> "testEquals " <> show v1 <> ", " <> show v2

testFloor :: Effect Unit
testFloor =
  quickCheck \(ArbVec2 v) ->
    let
      floor1 :: Array Number
      floor1 = numbers $ floor v

      floor2 :: Array Number
      floor2 = map Math.floor (numbers v)
    in
      epsilonEqualArrays floor1 floor2 <?> "testFloor " <> show v

testInverse :: Effect Unit
testInverse =
  quickCheck \(ArbVec2 v) ->
    let
      v1 = inverse v

      v2 = Vec2.map (\n -> 1.0 / n) v
    in
      v1 == v2 <?> "testInverse " <> show v <> " -> " <> show (inverse v)

testLength :: Effect Unit
testLength =
  quickCheck \(ArbVec2 v) ->
    GLMatrix.epsilonEquals (length v) (manualLength v) <?> "testLength " <> show v <> " -> " <> show (manualLength v)
  where
  manualLength v = Math.sqrt $ sum $ map (\n -> n * n) (numbers v)

testLerpDouble :: Effect Unit
testLerpDouble =
  quickCheck \(ArbVec2 v) ->
    let
      vDouble = scale v 2.0
    in
      epsilonEquals (lerp v vDouble 1.0) vDouble <?> "testLerpDouble " <> show v

testLerpOriginal :: Effect Unit
testLerpOriginal =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) ->
    epsilonEquals (lerp v1 v2 0.0) v1 <?> "testLerpOriginal " <> show v1 <> ", " <> show v2

testLerpDifferent :: Effect Unit
testLerpDifferent =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) ->
    epsilonEquals (lerp v1 v2 1.0) v2 <?> "testLerpDifferent " <> show v1 <> ", " <> show v2

testMaxDouble :: Effect Unit
testMaxDouble =
  quickCheck \(ArbVec2 v) ->
    let
      vDouble = scale v 2.0
    in
      epsilonEquals (max v vDouble) vDouble <?> "testMaxDouble " <> show v

testMinDouble :: Effect Unit
testMinDouble =
  quickCheck \(ArbVec2 v) ->
    let
      vDouble = scale v 2.0
    in
      epsilonEquals (min v vDouble) v <?> "testMinDouble " <> show v

testMultiply :: Effect Unit
testMultiply =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) ->
    let
      r1 = multiply v1 v2

      r2 = Vec2.zipWith (*) v1 v2
    in
      epsilonEquals r1 r2 <?> "testMultiply " <> show v1 <> ", " <> show v2

testNegate :: Effect Unit
testNegate =
  quickCheck \(ArbVec2 v) ->
    let
      r1 = negate v

      r2 = Vec2.map Prelude.negate v
    in
      epsilonEquals r1 r2 <?> "testNegate " <> show v

testNormalize :: Effect Unit
testNormalize =
  quickCheck \(ArbVec2 v) ->
    let
      r1 = normalize v

      len = length v

      r2 = scale v (1.0 / len)
    in
      epsilonEquals r1 r2 <?> "testNormalize " <> show v

testRotate :: Effect Unit
testRotate =
  quickCheck \(ArbVec2 v) r ->
    let
      r1 = rotate v v r
    in
      epsilonEquals r1 v <?> "testRotate " <> show v <> ", " <> show r

testRound :: Effect Unit
testRound =
  quickCheck \(ArbVec2 v) ->
    let
      round1 :: Array Number
      round1 = numbers $ round v

      round2 :: Array Number
      round2 = map Math.round (numbers v)
    in
      epsilonEqualArrays round1 round2 <?> "testRound " <> show v

testScaleAndAdd :: Effect Unit
testScaleAndAdd =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) s ->
    let
      r1 = scaleAndAdd v1 v2 s

      r2 = add v1 (scale v2 s)
    in
      epsilonEquals r1 r2 <?> "testScaleAndAdd " <> show v1 <> ", " <> show v2 <> ", " <> show s

testSquaredDistance :: Effect Unit
testSquaredDistance =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) ->
    let
      r1 = squaredDistance v1 v2

      d = distance v1 v2

      r2 = d * d
    in
      GLMatrix.epsilonEquals r1 r2 <?> "testSquaredDistance " <> show v1 <> ", " <> show v2

testSquaredLength :: Effect Unit
testSquaredLength =
  quickCheck \(ArbVec2 v) ->
    let
      r1 = squaredLength v

      l = length v

      r2 = l * l
    in
      GLMatrix.epsilonEquals r1 r2 <?> "testSquaredLength " <> show v

testSubtract :: Effect Unit
testSubtract =
  quickCheck \(ArbVec2 v1) (ArbVec2 v2) ->
    let
      r1 = subtract v1 v2

      r2 = add v1 (negate v2)
    in
      epsilonEquals r1 r2 <?> "testSubtract " <> show v1 <> ", " <> show v2

testTransformMat2 :: Effect Unit
testTransformMat2 =
  quickCheck \(ArbVec2 v) ->
    let
      r1 = transformMat2 v Mat2.identity
    in
      epsilonEquals r1 v <?> "testTransformMat2 " <> show v

testTransformMat3 :: Effect Unit
testTransformMat3 =
  quickCheck \(ArbVec2 v) (ArbMat3 m1) ->
    let
      nums = unsafePartial $ extractNumbers $ Mat3.numbers m1

      m2 = unsafePartial $ Mat3.unsafeFromNumbers nums

      r1 = transformMat3 v m1

      r2 = transformMat3 v m2
    in
      epsilonEquals r1 r2 <?> "testTransformMat3 " <> show v <> " " <> show m1
  where
  extractNumbers :: Partial => Array Number -> Array Number
  extractNumbers [ m00, m01, _, m10, m11, _, m20, m21, _ ] = [ m00, m01, 1.0, m10, m11, 1.0, m20, m21, 1.0 ]

testZero :: Effect Unit
testZero =
  quickCheck \r ->
    let
      v = zero

      r1 = scale v r
    in
      epsilonEquals r1 v <?> "testZero " <> show r

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
  testRotate
  testRound
  testScaleAndAdd
  testSquaredDistance
  testSquaredLength
  testSubtract
  testTransformMat2
  testTransformMat3
  testZero
