module Test.Main where

import Prelude

import Effect (Effect)
import GLMatrix (MatrixArrayType(..), equals, setMatrixArrayType, toRadian)
import Math (pi)
import Test.QuickCheck (quickCheck, (<?>))
import Test.TestMat2 as TestMat2

-- |Covers `setMatrixArrayType`, `equals` and `toRadian`, so the whole root package
testToRadian :: Effect Unit
testToRadian = do
  setMatrixArrayType MatrixArrayTypeFloat32Array
  setMatrixArrayType MatrixArrayTypeArray
  quickCheck \n -> equals (toRadian n) (n * pi / 180.0) <?> "toRadian " <> show n <> " not correct"

main :: Effect Unit
main = do
  testToRadian
  TestMat2.main
