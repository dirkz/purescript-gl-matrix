module Test.Main where

import Prelude

import Effect (Effect)
import GLMatrix (equals, toRadian)
import Math (pi)
import Test.QuickCheck (quickCheck, (<?>))

testToRadian :: Effect Unit
testToRadian = do
  quickCheck \n -> equals (toRadian n) (n * pi / 180.0) <?> "toRadian " <> show n <> " not correct"

main :: Effect Unit
main = do
  testToRadian
