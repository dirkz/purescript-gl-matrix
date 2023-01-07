-- |All supported functions are tested (see http://glmatrix.net/docs/module-mat2d.html).
module Test.TestMat2d where

import Test.Arbitrary
import Data.Array (unsafeIndex)
import Data.Foldable (maximum, sum)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import GLMatrix (equalArrays)
import GLMatrix as GLMatrix
import GLMatrix.Mat2d (Mat2d, add, determinant, equals, frob, fromRotation, fromValues, identity, invert, multiply, multiplyScalar, multiplyScalarAndAdd, numbers, rotate, subtract, unsafeFromNumbers)
import GLMatrix.Mat2d as Mat2d
import GLMatrix.Mat2d.Mix (fromScaling, fromTranslation, fromVec2, scale, translate)
import Data.Number (sqrt)
import Data.Number as Math
import Partial.Unsafe (unsafePartial)
import Prelude (Unit, discard, map, show, ($), (*), (+), (/=), (<), (<>), (==))
import Test.QuickCheck (quickCheck, (<?>))

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbMat2d m) ->
    let
      added = add m m

      multiplied = multiplyScalar m 2.0
    in
      added == multiplied <?> "testAdd " <> show m

testNotEqual :: Effect Unit
testNotEqual =
  quickCheck \n ->
    multiplyScalar identity n /= multiplyScalar identity (n + 1.0) <?> "testNotEqual " <> show n

testDeterminant :: Effect Unit
testDeterminant =
  quickCheck \(ArbVec2 v) ->
    GLMatrix.equals (determinant $ fromVec2 v v) 0.0

testFrob :: Effect Unit
testFrob =
  quickCheck \(ArbMat2d m) ->
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
    equals (fromScaling v) (scale identity v) <?> "testFromScaling " <> show v

testFromTranslation :: Effect Unit
testFromTranslation =
  quickCheck \(ArbVec2 v) ->
    equals (fromTranslation v) (translate identity v) <?> "testFromTranslation " <> show v

testFromValues :: Effect Unit
testFromValues =
  quickCheck \(ArbMat2d m) ->
    let
      ns = numbers m

      r =
        fromValues
          (ind ns 0)
          (ind ns 1)
          (ind ns 2)
          (ind ns 3)
          (ind ns 4)
          (ind ns 5)
    in
      r == m <?> "testFromValues " <> show m
  where
  ind xs n = unsafePartial $ unsafeIndex xs n

testInvert :: Effect Unit
testInvert =
  quickCheck \(ArbMat2d m) ->
    let
      m1 = multiply m (invert m)

      m2 = multiply (invert m) m

      diff1 :: Number
      diff1 = maxDiff m1 identity

      diff2 :: Number
      diff2 = maxDiff m2 identity
    in
      diff1 < maxAllowedDiff
        <?> "testInvert "
        <> show m
        <> " "
        <> show identity
        <> " -> "
        <> show m1
        <> " "
        <> show m2
        <> " "
        <> show diff1
        <> " "
        <> show diff2
  where
  maxAllowedDiff = 0.001

  maxDiff :: Mat2d -> Mat2d -> Number
  maxDiff m1 m2 = case maximum $ map Math.abs $ numbers $ subtract m1 m2 of
    Just d -> d
    Nothing -> maxAllowedDiff

testMultiply :: Effect Unit
testMultiply =
  quickCheck \(ArbMat2d m1) (ArbMat2d m2) ->
    let
      resM1 = multiply m1 m2

      resM2 = multiply m2 m1
    in
      resM1 /= resM2 <?> "testMultiply " <> show m1 <> " " <> show m2

testMultiplyDistributivity :: Effect Unit
testMultiplyDistributivity =
  quickCheck \(ArbMat2d m1) (ArbMat2d m2) (ArbMat2d m3) ->
    let
      resM1 = multiply m1 (add m2 m3)

      resM2 = add (multiply m2 m1) m3
    in
      resM1 /= resM2 <?> "testMultiplyDistributivity " <> show m1 <> " " <> show m2 <> " " <> show m3

testMultiplyScalar :: Effect Unit
testMultiplyScalar =
  quickCheck \(ArbMat2d m) s ->
    let
      resM1 = multiplyScalar m s

      resM2 = Mat2d.map (\n -> n * s) m
    in
      resM1 == resM2 <?> "testMultiplyScalar " <> show m <> " " <> show s

testMultiplyScalarAndAdd :: Effect Unit
testMultiplyScalarAndAdd =
  quickCheck \(ArbMat2d m1) (ArbMat2d m2) s ->
    let
      resM1 = multiplyScalarAndAdd m1 m2 s

      resM2 = add m1 (multiplyScalar m2 s)
    in
      equals resM1 resM2 <?> "testMultiplyScalarAndAdd " <> show m1 <> " " <> show m2 <> " " <> show s

testSubtract :: Effect Unit
testSubtract =
  quickCheck \(ArbMat2d m1) (ArbMat2d m2) ->
    equals m1 (subtract (add m1 m2) m2) <?> "testSubtract " <> show m1 <> " " <> show m2

testExtractNumbers :: Effect Unit
testExtractNumbers =
  quickCheck \(ArbMat2d m1) ->
    let
      ns = numbers m1

      m2 = unsafePartial $ unsafeFromNumbers ns
    in
      equalArrays (numbers m1) ns <?> "testExtractNumbers " <> show m1 <> " != " <> show m2

main :: Effect Unit
main = do
  testAdd
  testNotEqual
  testFrob
  testFromRotation
  testFromScaling
  testFromTranslation
  testFromValues
  testInvert
  testMultiply
  testMultiplyDistributivity
  testMultiplyScalar
  testMultiplyScalarAndAdd
  testSubtract
  testExtractNumbers
