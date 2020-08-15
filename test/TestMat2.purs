module Test.TestMat2 where

import Effect (Effect)
import GLMatrix.Mat2 (add, adjoint, determinant, equals, exactEquals, fromValues, identity, multiplyScalar)
import Prelude (Unit, discard, show, (&&), (+), (/), (/=), (<>), (==))
import Test.QuickCheck (quickCheck, (<?>))

testAdd :: Effect Unit
testAdd = do
  quickCheck \n ->
    let
      m = fromValues n n n n

      added = add m m

      multiplied = multiplyScalar m 2.0
    in
      added == multiplied && exactEquals added multiplied <?> "testAdd " <> show n

testNotEqual :: Effect Unit
testNotEqual = do
  quickCheck \n -> multiplyScalar identity n /= multiplyScalar identity (n + 1.0)

testAdjoint :: Effect Unit
testAdjoint = do
  quickCheck \n ->
    let
      m = identity

      m2 = multiplyScalar (multiplyScalar m n) (1.0 / n) -- somehow utilize n
    in
      equals (adjoint m) m2 <?> "testAdjoint " <> show n

testDeterminantZero :: Effect Unit
testDeterminantZero = quickCheck \m00 m01 -> determinant (fromValues m00 m01 m00 m01) == 0.0

main :: Effect Unit
main = do
  testAdd
  testNotEqual
  testAdjoint
  testDeterminantZero
