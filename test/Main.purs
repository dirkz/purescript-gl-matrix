module Test.Main where

import Prelude

import Effect (Effect)
import GLMatrix (epsilonEquals, setMatrixArrayTypeToArray, toRadian)
import Math (pi)
import Test.QuickCheck (quickCheck, (<?>))
import Test.TestMat2 as TestMat2

-- |Covers `setMatrixArrayType`, `equals` and `toRadian`, so the whole root package
testToRadian :: Effect Unit
testToRadian = do
  quickCheck \n -> epsilonEquals (toRadian n) (n * pi / 180.0) <?> "testToRadian " <> show n

main :: Effect Unit
main = do
  setMatrixArrayTypeToArray
  testToRadian
  TestMat2.main
