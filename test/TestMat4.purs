module Test.TestMat4 where

import Test.Arbitrary

import Data.Foldable (sum)
import Effect (Effect)
import GLMatrix (epsilonEqualArrays)
import GLMatrix as GLMatrix
import GLMatrix.Mat4 (add, adjoint, determinant, epsilonEquals, frob, fromRotation, fromScaling, fromTranslation, fromXRotation, fromYRotation, fromZRotation, identity, invert, multiply, multiplyScalar, numbers, rotate, rotateX, rotateY, rotateZ, scale, subtract, translate, transpose, unsafeFromNumbers)
import GLMatrix.Mat4.Mix (fromVec4)
import Math (sqrt)
import Partial.Unsafe (unsafePartial)
import Prelude (Unit, discard, map, show, ($), (*), (+), (/), (/=), (<>), (==))
import Test.QuickCheck (quickCheck, (<?>))

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbMat4 m) ->
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

testDeterminant :: Effect Unit
testDeterminant =
  quickCheck \(ArbVec4 v) ->
    GLMatrix.epsilonEquals (determinant $ fromVec4 v v v v) 0.0

testFrob :: Effect Unit
testFrob =
  quickCheck \(ArbMat4 m) ->
    let
      theFrob = frob m

      theSum = sqrt $ sum (map (\n -> n * n) (numbers m))
    in
      GLMatrix.epsilonEquals theFrob theSum <?> "testFrob " <> show m <> " frob " <> show theFrob <> " sum " <> show theSum

testFromRotation :: Effect Unit
testFromRotation =
  quickCheck \r (ArbVec3 v) ->
    epsilonEquals (fromRotation r v) (rotate identity r v) <?> "testFromRotation " <> show r

testFromScaling :: Effect Unit
testFromScaling =
  quickCheck \(ArbVec3 v) ->
    epsilonEquals (fromScaling v) (scale identity v) <?> "testFromScaling " <> show v

testFromTranslation :: Effect Unit
testFromTranslation =
  quickCheck \(ArbVec3 v) ->
    epsilonEquals (fromTranslation v) (translate identity v) <?> "testFromTranslation " <> show v

testFromXRotation :: Effect Unit
testFromXRotation =
  quickCheck \r ->
    epsilonEquals (fromXRotation r) (rotateX identity r) <?> "testFromXRotation " <> show r

testFromYRotation :: Effect Unit
testFromYRotation =
  quickCheck \r ->
    epsilonEquals (fromYRotation r) (rotateY identity r) <?> "testFromYRotation " <> show r

testFromZRotation :: Effect Unit
testFromZRotation =
  quickCheck \r ->
    epsilonEquals (fromZRotation r) (rotateZ identity r) <?> "testFromZRotation " <> show r

testInvert :: Effect Unit
testInvert =
  quickCheck \(ArbMat4 m) ->
    epsilonEquals (multiply m (invert m)) identity <?> "testInvert " <> show m

testMultiply :: Effect Unit
testMultiply =
  quickCheck \(ArbMat4 m1) (ArbMat4 m2) ->
    let
      resM1 = multiply m1 m2

      resM2 = multiply m2 m1
    in
      resM1 /= resM2 <?> "testMultiply " <> show m1 <> " " <> show m2

testMultiplyDistributivity :: Effect Unit
testMultiplyDistributivity =
  quickCheck \(ArbMat4 m1) (ArbMat4 m2) (ArbMat4 m3) ->
    let
      resM1 = multiply m1 (add m2 m3)

      resM2 = add (multiply m2 m1) m3
    in
      resM1 /= resM2 <?> "testMultiplyDistributivity " <> show m1 <> " " <> show m2 <> " " <> show m3

testSubtract :: Effect Unit
testSubtract =
  quickCheck \(ArbMat4 m1) (ArbMat4 m2) ->
    epsilonEquals m1 (subtract (add m1 m2) m2) <?> "testSubtract " <> show m1 <> " " <> show m2

testTranspose :: Effect Unit
testTranspose =
  quickCheck \(ArbMat4 m1) (ArbMat4 m2) ->
    let
      resM1 = transpose $ multiply m1 m2

      resM2 = multiply (transpose m2) (transpose m1)
    in
      resM1 == resM2 <?> "testTranspose " <> show m1 <> " " <> show m2

testExtractNumbers :: Effect Unit
testExtractNumbers =
  quickCheck \(ArbMat4 m1) ->
    let
      ns = numbers m1

      m2 = unsafePartial $ unsafeFromNumbers ns
    in
      epsilonEqualArrays (numbers m1) ns <?> "testExtractNumbers " <> show m1 <> " != " <> show m2

main :: Effect Unit
main = do
  testAdd
  testNotEqual
  testAdjoint
  testFrob
  testFromRotation
  testFromScaling
  testFromTranslation
  testFromXRotation
  testFromYRotation
  testFromZRotation
  testMultiply
  testMultiplyDistributivity
  testSubtract
  testTranspose
  testExtractNumbers
