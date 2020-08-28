-- |All supported functions are tested (see http://glmatrix.net/docs/module-mat2.html).
module Test.TestMat2 where

import Test.Arbitrary
import Data.Foldable (sum)
import Effect (Effect)
import GLMatrix (equalArrays)
import GLMatrix as GLMatrix
import GLMatrix.Mat2 (add, adjoint, determinant, equals, frob, fromRotation, fromValues, identity, invert, ldu, multiply, multiplyScalar, multiplyScalarAndAdd, numbers, rotate, subtract, transpose, unsafeFromNumbers)
import GLMatrix.Mat2.Mix (scale, fromScaling)
import GLMatrix.Vec2 as Vec2
import Math (sqrt)
import Partial.Unsafe (unsafePartial)
import Prelude (Unit, discard, map, negate, show, ($), (*), (+), (/), (/=), (<>), (==))
import Test.QuickCheck (quickCheck, (<?>))

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbMat2 m) ->
    let
      added = add m m

      multiplied = multiplyScalar m 2.0
    in
      added == multiplied <?> "testAdd " <> show m

testNotEqual :: Effect Unit
testNotEqual =
  quickCheck \n ->
    multiplyScalar identity n /= multiplyScalar identity (n + 1.0) <?> "testNotEqual " <> show n

testAdjoint :: Effect Unit
testAdjoint =
  quickCheck \n ->
    let
      m = identity

      m2 = multiplyScalar (multiplyScalar m n) (1.0 / n) -- somehow utilize n
    in
      equals (adjoint m) m2 <?> "testAdjoint " <> show n

testDeterminantZero :: Effect Unit
testDeterminantZero =
  quickCheck \m00 m01 ->
    determinant (fromValues m00 m01 m00 m01) == 0.0 <?> "testDeterminantZero " <> show [ m00, m01 ]

testDeterminantNonZero :: Effect Unit
testDeterminantNonZero =
  quickCheck \m00 m01 ->
    determinant (fromValues m00 m01 m01 m00) /= 0.0 <?> "testDeterminantNonZero " <> show [ m00, m01 ]

testFrob :: Effect Unit
testFrob =
  quickCheck \(ArbMat2 m) ->
    let
      theFrob = frob m

      theSum = sqrt $ sum (map (\n -> n * n) (numbers m))
    in
      GLMatrix.equals theFrob theSum <?> "testFrob " <> show m <> " frob " <> show theFrob <> " sum " <> show theSum

testFromRotation :: Effect Unit
testFromRotation =
  quickCheck \r ->
    equals (fromRotation r) (rotate identity r) <?> "testFromRotation " <> show r

testFromScaling :: Effect Unit
testFromScaling =
  quickCheck \(ArbVec2 v) ->
    let
      m1 = fromScaling v

      m2 = scale identity v
    in
      m1 == m2 <?> "testFromScaling " <> show v

testInvert :: Effect Unit
testInvert =
  quickCheck \(ArbMat2 m) ->
    equals (multiply m (invert m)) identity <?> "testInvert " <> show m

testLDU :: Effect Unit
testLDU =
  quickCheck \(ArbMat2 m) ->
    let
      lduRec = ldu m
    in
      lduRec.d == (fromValues 1.0 0.0 0.0 1.0) <?> "testLDU " <> show m <> " -> " <> show lduRec

testMultiply :: Effect Unit
testMultiply =
  quickCheck \(ArbMat2 m1) (ArbMat2 m2) ->
    let
      resM1 = multiply m1 m2

      resM2 = multiply m2 m1
    in
      resM1 /= resM2 <?> "testMultiply " <> show m1 <> " " <> show m2

testMultiplyDistributivity :: Effect Unit
testMultiplyDistributivity =
  quickCheck \(ArbMat2 m1) (ArbMat2 m2) (ArbMat2 m3) ->
    let
      resM1 = multiply m1 (add m2 m3)

      resM2 = add (multiply m2 m1) m3
    in
      resM1 /= resM2 <?> "testMultiplyDistributivity " <> show m1 <> " " <> show m2 <> " " <> show m3

testMultiplyScalarAndAdd :: Effect Unit
testMultiplyScalarAndAdd =
  quickCheck \r (ArbMat2 m1) (ArbMat2 m2) ->
    let
      resM1 = multiplyScalarAndAdd m1 m2 r

      resM2 = add m1 (scale m2 (Vec2.fromValues r r))
    in
      equals resM1 resM2 <?> "testMultiplyScalarAndAdd " <> show m1 <> " " <> show m2

testMultiplyScalar :: Effect Unit
testMultiplyScalar =
  quickCheck \r (ArbMat2 m) ->
    let
      resM1 = multiplyScalar m r

      resM2 = scale m (Vec2.fromValues r r)
    in
      equals resM1 resM2 <?> "testMultiplyScalar " <> show r <> " " <> show m

testRotate :: Effect Unit
testRotate =
  quickCheck \r (ArbMat2 m) ->
    let
      resM1 = rotate m r

      resM2 = rotate resM1 (negate r)
    in
      equals m resM2 <?> "testRotate " <> show m

testSubtract :: Effect Unit
testSubtract =
  quickCheck \(ArbMat2 m1) (ArbMat2 m2) ->
    equals m1 (subtract (add m1 m2) m2) <?> "testSubtract " <> show m1 <> " " <> show m2

testTranspose :: Effect Unit
testTranspose =
  quickCheck \(ArbMat2 m1) (ArbMat2 m2) ->
    let
      resM1 = transpose $ multiply m1 m2

      resM2 = multiply (transpose m2) (transpose m1)
    in
      resM1 == resM2 <?> "testTranspose " <> show m1 <> " " <> show m2

testExtractNumbers :: Effect Unit
testExtractNumbers =
  quickCheck \(ArbMat2 m1) ->
    let
      ns = numbers m1

      m2 = unsafePartial $ unsafeFromNumbers ns
    in
      equalArrays (numbers m1) ns <?> "testExtractNumbers " <> show m1 <> " != " <> show m2

main :: Effect Unit
main = do
  testAdd
  testNotEqual
  testAdjoint
  testDeterminantZero
  testDeterminantNonZero
  testFrob
  testFromRotation
  testFromScaling
  testLDU
  testMultiply
  testMultiplyDistributivity
  testMultiplyScalarAndAdd
  testMultiplyScalar
  testRotate
  testSubtract
  testTranspose
  testExtractNumbers
