module Test.TestMat2 where

import Data.Foldable (sum)
import Effect (Effect)
import GLMatrix (epsilonEqualArrays)
import GLMatrix as GLMatrix
import GLMatrix.Mat2 (Mat2, add, adjoint, determinant, epsilonEquals, frob, fromRotation, fromValues, identity, invert, ldu, multiply, multiplyScalar, multiplyScalarAndAdd, numbers, rotate, subtract, transpose)
import GLMatrix.MatVec2 (fromScaling, scale)
import GLMatrix.Vec2 as Vec2
import Math (sqrt)
import Partial.Unsafe (unsafeCrashWith, unsafePartial)
import Prelude (Unit, discard, map, negate, show, ($), (*), (+), (/), (/=), (<$>), (<*>), (<>), (==))
import Test.QuickCheck (class Arbitrary, arbitrary, quickCheck, (<?>))
import Test.TestVec2 (ArbVec2(..))

newtype ArbMat2
  = ArbMat2 Mat2

instance arbMat2 :: Arbitrary ArbMat2 where
  arbitrary = ArbMat2 <$> (fromValues <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary)

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbMat2 m) ->
    let
      added = add m m

      multiplied = multiplyScalar m 2.0
    in
      added == multiplied <?> "testAdd " <> show m

testNotEqual :: Effect Unit
testNotEqual = quickCheck \n -> multiplyScalar identity n /= multiplyScalar identity (n + 1.0)

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
    determinant (fromValues m00 m01 m01 m00) /= 0.0 <?> "testDeterminantZero " <> show [ m00, m01 ]

testFrob :: Effect Unit
testFrob =
  quickCheck \(ArbMat2 m) ->
    let
      theFrob = frob m

      theSum = sqrt $ sum (map (\n -> n * n) (numbers m))
    in
      GLMatrix.epsilonEquals theFrob theSum <?> "testFrob " <> show m <> " frob " <> show theFrob <> " sum " <> show theSum

testFromRotation :: Effect Unit
testFromRotation = quickCheck \r -> epsilonEquals (fromRotation r) (rotate identity r)

testFromScaling :: Effect Unit
testFromScaling =
  quickCheck \(ArbVec2 v) ->
    let
      m1 = fromScaling v

      m2 = scale identity v
    in
      m1 == m2

testInvert :: Effect Unit
testInvert =
  quickCheck \(ArbMat2 m) ->
    epsilonEquals (multiply m (invert m)) identity

testLDU :: Effect Unit
testLDU =
  quickCheck \(ArbMat2 m) ->
    let
      lduRec = ldu m
    in
      lduRec.d == (fromValues 1.0 0.0 0.0 1.0) <?> show lduRec

testMultiply :: Effect Unit
testMultiply =
  quickCheck \(ArbMat2 m1) (ArbMat2 m2) ->
    let
      resM1 = multiply m1 m2

      resM2 = multiply m2 m1
    in
      resM1 /= resM2

testMultiplyDistributivity :: Effect Unit
testMultiplyDistributivity =
  quickCheck \(ArbMat2 m1) (ArbMat2 m2) (ArbMat2 m3) ->
    let
      resM1 = multiply m1 (add m2 m3)

      resM2 = add (multiply m2 m1) m3
    in
      resM1 /= resM2

testMultiplyScalarAndAdd :: Effect Unit
testMultiplyScalarAndAdd =
  quickCheck \r (ArbMat2 m1) (ArbMat2 m2) ->
    let
      resM1 = multiplyScalarAndAdd m1 m2 r

      resM2 = add m1 (scale m2 (Vec2.fromValues r r))
    in
      epsilonEquals resM1 resM2 <?> show "testMultiplyScalarAndAdd " <> show m1 <> " " <> show m2

testMultiplyScalar :: Effect Unit
testMultiplyScalar =
  quickCheck \r (ArbMat2 m) ->
    let
      resM1 = multiplyScalar m r

      resM2 = scale m (Vec2.fromValues r r)
    in
      epsilonEquals resM1 resM2 <?> show "testMultiplyScalar " <> show r <> " " <> show m

testRotate :: Effect Unit
testRotate =
  quickCheck \r (ArbMat2 m) ->
    let
      resM1 = rotate m r

      resM2 = rotate resM1 (negate r)
    in
      epsilonEquals m resM2

testSubtract :: Effect Unit
testSubtract =
  quickCheck \(ArbMat2 m1) (ArbMat2 m2) ->
    epsilonEquals m1 $ subtract (add m1 m2) m2

testTranspose :: Effect Unit
testTranspose =
  quickCheck \(ArbMat2 m1) (ArbMat2 m2) ->
    let
      resM1 = transpose $ multiply m1 m2

      resM2 = multiply (transpose m2) (transpose m1)
    in
      resM1 == resM2

fromNumbers :: Array Number -> Mat2
fromNumbers [ m00, m01, m10, m11 ] = fromValues m00 m01 m10 m11

fromNumbers _ = unsafeCrashWith "Mat22.numbers must produce exactly 2 numbers"

testExtractNumbers :: Effect Unit
testExtractNumbers =
  quickCheck \(ArbMat2 m1) ->
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
