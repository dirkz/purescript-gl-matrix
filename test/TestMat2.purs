module Test.TestMat2 where

import Data.Foldable (sum)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import GLMatrix as GLMatrix
import GLMatrix.Mat2 (Mat2, add, adjoint, determinant, epsilonEquals, exactEquals, frob, fromRotation, fromValues, identity, invert, ldu, multiply, multiplyScalar, rotate)
import GLMatrix.MatVec2 (fromScaling, scale)
import GLMatrix.Vec2 as Vec2
import Math (sqrt)
import Prelude (Unit, discard, map, show, ($), (&&), (*), (+), (/), (/=), (<$>), (<*>), (<>), (==))
import Prim.Boolean (True)
import Test.QuickCheck (class Arbitrary, arbitrary, quickCheck, (<?>))

newtype ArbMat2
  = ArbMat2 Mat2

instance arbMat2 :: Arbitrary ArbMat2 where
  arbitrary = ArbMat2 <$> (fromValues <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary)

testAdd :: Effect Unit
testAdd =
  quickCheck \n ->
    let
      m = fromValues n n n n

      added = add m m

      multiplied = multiplyScalar m 2.0
    in
      added == multiplied && exactEquals added multiplied <?> "testAdd " <> show n

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
  quickCheck \m00 m01 m10 m11 ->
    let
      xs = [ m00, m01, m10, m11 ]

      theFrob = frob (fromValues m00 m01 m10 m11)

      theSum = sqrt $ sum (map (\n -> n * n) xs)
    in
      GLMatrix.epsilonEquals theFrob theSum <?> "testFrob " <> show xs <> " frob " <> show theFrob <> " sum " <> show theSum

testFromRotation :: Effect Unit
testFromRotation = quickCheck \r -> epsilonEquals (fromRotation r) (rotate identity r)

testFromScaling :: Effect Unit
testFromScaling =
  quickCheck \x y ->
    let
      v = Vec2.fromValues x y

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
