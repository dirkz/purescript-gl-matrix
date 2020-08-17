module Test.TestMat3 where

import Data.Foldable (sum)
import Effect (Effect)
import GLMatrix (epsilonEqualArrays)
import GLMatrix as GLMatrix
import GLMatrix.Mat3 (Mat3, add, adjoint, determinant, epsilonEquals, frob, fromRotation, fromValues, identity, invert, ldu, multiply, multiplyScalar, multiplyScalarAndAdd, numbers, rotate, subtract, transpose)
import GLMatrix.MatVec2 (fromScaling, scale)
import GLMatrix.Vec2 as Vec2
import Math (sqrt)
import Partial.Unsafe (unsafeCrashWith, unsafePartial)
import Prelude (Unit, discard, map, negate, show, ($), (*), (+), (/), (/=), (<>), (==))
import Test.QuickCheck (quickCheck, (<?>))
import Test.Arbitrary

fromNumbers :: Array Number -> Mat3
fromNumbers [ m00, m01, m10, m11 ] = fromValues m00 m01 m10 m11

fromNumbers _ = unsafeCrashWith "Mat3.numbers must produce exactly 2 numbers"

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbMat3 m) ->
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
      epsilonEquals (adjoint m) m2 <?> "testAdjoint " <> show n

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
  quickCheck \(ArbMat3 m) ->
    let
      theFrob = frob m

      theSum = sqrt $ sum (map (\n -> n * n) (numbers m))
    in
      GLMatrix.epsilonEquals theFrob theSum <?> "testFrob " <> show m <> " frob " <> show theFrob <> " sum " <> show theSum

testFromRotation :: Effect Unit
testFromRotation =
  quickCheck \r ->
    epsilonEquals (fromRotation r) (rotate identity r) <?> "testFromRotation " <> show r

{-
testFromScaling :: Effect Unit
testFromScaling =
  quickCheck \(ArbVec2 v) ->
    let
      m1 = fromScaling v

      m2 = scale identity v
    in
      m1 == m2 <?> "testFromScaling " <> show v
      -}

testInvert :: Effect Unit
testInvert =
  quickCheck \(ArbMat3 m) ->
    epsilonEquals (multiply m (invert m)) identity <?> "testInvert " <> show m

testLDU :: Effect Unit
testLDU =
  quickCheck \(ArbMat3 m) ->
    let
      lduRec = ldu m
    in
      lduRec.d == (fromValues 1.0 0.0 0.0 1.0) <?> "testLDU " <> show m <> " -> " <> show lduRec

testMultiply :: Effect Unit
testMultiply =
  quickCheck \(ArbMat3 m1) (ArbMat3 m2) ->
    let
      resM1 = multiply m1 m2

      resM2 = multiply m2 m1
    in
      resM1 /= resM2 <?> "testMultiply " <> show m1 <> ", " <> show m2

testMultiplyDistributivity :: Effect Unit
testMultiplyDistributivity =
  quickCheck \(ArbMat3 m1) (ArbMat3 m2) (ArbMat3 m3) ->
    let
      resM1 = multiply m1 (add m2 m3)

      resM2 = add (multiply m2 m1) m3
    in
      resM1 /= resM2 <?> "testMultiplyDistributivity " <> show m1 <> ", " <> show m2 <> ", " <> show m3

{-
testMultiplyScalarAndAdd :: Effect Unit
testMultiplyScalarAndAdd =
  quickCheck \r (ArbMat3 m1) (ArbMat3 m2) ->
    let
      resM1 = multiplyScalarAndAdd m1 m2 r

      resM2 = add m1 (scale m2 (Vec2.fromValues r r))
    in
      epsilonEquals resM1 resM2 <?> "testMultiplyScalarAndAdd " <> show m1 <> " " <> show m2
      -}

{-
testMultiplyScalar :: Effect Unit
testMultiplyScalar =
  quickCheck \r (ArbMat3 m) ->
    let
      resM1 = multiplyScalar m r

      resM2 = scale m (Vec2.fromValues r r)
    in
      epsilonEquals resM1 resM2 <?> "testMultiplyScalar " <> show r <> " " <> show m
      -}

testRotate :: Effect Unit
testRotate =
  quickCheck \r (ArbMat3 m) ->
    let
      resM1 = rotate m r

      resM2 = rotate resM1 (negate r)
    in
      epsilonEquals m resM2 <?> "testRotate " <> show m

testSubtract :: Effect Unit
testSubtract =
  quickCheck \(ArbMat3 m1) (ArbMat3 m2) ->
    epsilonEquals m1 (subtract (add m1 m2) m2) <?> "testSubtract " <> show m1 <> " " <> show m2

testTranspose :: Effect Unit
testTranspose =
  quickCheck \(ArbMat3 m1) (ArbMat3 m2) ->
    let
      resM1 = transpose $ multiply m1 m2

      resM2 = multiply (transpose m2) (transpose m1)
    in
      resM1 == resM2 <?> "testTranspose " <> show m1 <> " " <> show m2

testExtractNumbers :: Effect Unit
testExtractNumbers =
  quickCheck \(ArbMat3 m1) ->
    let
      ns = numbers m1

      m2 = unsafePartial $ fromNumbers ns
    in
      epsilonEqualArrays (numbers m1) ns <?> "testExtractNumbers " <> show m1 <> " != " <> show m2

main :: Effect Unit
main = do
  testAdd
  testNotEqual
  testAdjoint
  testDeterminantZero
  testDeterminantNonZero
  testFrob
  testFromRotation
  --testFromScaling
  testLDU
  testMultiply
  testMultiplyDistributivity
  --testMultiplyScalarAndAdd
  --testMultiplyScalar
  testRotate
  testSubtract
  testTranspose
  testExtractNumbers
