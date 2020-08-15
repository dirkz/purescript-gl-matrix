module Test.TestMat2 where

import Effect (Effect)
import GLMatrix.Mat2 (add, exactEquals, fromValues, multiplyScalar)
import Prelude (Unit, (==), (&&))
import Test.QuickCheck (quickCheck)

testAdd :: Effect Unit
testAdd = do
  quickCheck \n ->
    let
      m = fromValues n n n n

      added = add m m

      multiplied = multiplyScalar m 2.0
    in
      added == multiplied && exactEquals added multiplied

main :: Effect Unit
main = do
  testAdd
