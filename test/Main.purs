module Test.Main where

import Prelude
import Data.Foldable (for_)
import Effect (Effect)
import GLMatrix (MatrixArrayType(..), epsilonEquals, setMatrixArrayType, toRadian)
import Math (pi)
import Test.QuickCheck (quickCheck, (<?>))
import Test.TestMat2 as TestMat2
import Test.TestVec2 as TestVec2
import Test.TestMat3 as TestMat3
import Test.TestVec3 as TestVec3

-- |Covers `setMatrixArrayType`, `equals` and `toRadian`, so the whole root package
testToRadian :: Effect Unit
testToRadian = do
  quickCheck \n -> epsilonEquals (toRadian n) (n * pi / 180.0) <?> "testToRadian " <> show n

main :: Effect Unit
main = do
  for_ [ MatrixArrayTypeFloat32Array, MatrixArrayTypeArray ] \arrayType -> do
    setMatrixArrayType arrayType
    testToRadian
    TestMat2.main
    TestVec2.main
    TestMat3.main
    TestVec3.main
