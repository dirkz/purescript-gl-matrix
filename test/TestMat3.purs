-- |All supported functions are tested (see http://glmatrix.net/docs/module-mat3.html).
module Test.TestMat3 where

import Test.Arbitrary
import Data.Array (unsafeIndex)
import Data.Foldable (sum)
import Effect (Effect)
import GLMatrix (equalArrays)
import GLMatrix as GLMatrix
import GLMatrix.Mat2d as Mat2d
import GLMatrix.Mat3 (add, adjoint, determinant, equals, frob, fromRotation, identity, invert, multiply, multiplyScalar, multiplyScalarAndAdd, numbers, projection, rotate, slice, subtract, transpose, unsafeFromNumbers, fromValues)
import GLMatrix.Mat3 as Mat3
import GLMatrix.Mat3.Mix (fromMat2d, fromMat4, fromQuat, fromScaling, fromTranslation, fromVec3, normalFromMat4, scale, translate)
import GLMatrix.Mat4 as Mat4
import GLMatrix.Quat (normalize)
import GLMatrix.Quat (equals) as Quat
import GLMatrix.Quat.Mix (fromMat3) as Quat
import Data.Number (sqrt)
import Partial.Unsafe (unsafePartial)
import Prelude (Unit, discard, map, negate, show, ($), (*), (+), (/), (/=), (<>), (==))
import Test.QuickCheck (quickCheck, (<?>))

testAdd :: Effect Unit
testAdd =
  quickCheck \(ArbMat3 m) ->
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
      equals (adjoint m) m2 <?> "testAdjoint " <> show n

testDeterminant :: Effect Unit
testDeterminant =
  quickCheck \(ArbVec3 v) ->
    GLMatrix.equals (determinant $ fromVec3 v v v) 0.0

testFrob :: Effect Unit
testFrob =
  quickCheck \(ArbMat3 m) ->
    let
      theFrob = frob m

      theSum = sqrt $ sum (map (\n -> n * n) (numbers m))
    in
      GLMatrix.equals theFrob theSum <?> "testFrob " <> show m <> " frob " <> show theFrob <> " sum " <> show theSum

testFromMat4 :: Effect Unit
testFromMat4 =
  quickCheck \(ArbMat4 m) ->
    let
      c1 = (Mat4.slice 0 3 m) <> (Mat4.slice 4 7 m) <> (Mat4.slice 8 11 m)

      c2 = numbers $ fromMat4 m
    in
      c1 == c2 <?> "testFromMat4 " <> show m <> " c1: " <> show c1 <> " c2: " <> show c2

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

testInvert :: Effect Unit
testInvert =
  quickCheck \(ArbMat3 m) ->
    equals (multiply m (invert m)) identity <?> "testInvert " <> show m

testMultiply :: Effect Unit
testMultiply =
  quickCheck \(ArbMat3 m1) (ArbMat3 m2) ->
    let
      resM1 = multiply m1 m2

      resM2 = multiply m2 m1
    in
      resM1 /= resM2 <?> "testMultiply " <> show m1 <> " " <> show m2

testMultiplyDistributivity :: Effect Unit
testMultiplyDistributivity =
  quickCheck \(ArbMat3 m1) (ArbMat3 m2) (ArbMat3 m3) ->
    let
      resM1 = multiply m1 (add m2 m3)

      resM2 = add (multiply m2 m1) m3
    in
      resM1 /= resM2 <?> "testMultiplyDistributivity " <> show m1 <> " " <> show m2 <> " " <> show m3

testMultiplyScalar :: Effect Unit
testMultiplyScalar =
  quickCheck \(ArbMat3 m) s ->
    let
      resM1 = multiplyScalar m s

      resM2 = Mat3.map (\n -> n * s) m
    in
      resM1 == resM2 <?> "testMultiplyScalar " <> show m <> " " <> show s

testMultiplyScalarAndAdd :: Effect Unit
testMultiplyScalarAndAdd =
  quickCheck \(ArbMat3 m1) (ArbMat3 m2) s ->
    let
      resM1 = multiplyScalarAndAdd m1 m2 s

      resM2 = add m1 $ Mat3.map (\n -> n * s) m2
    in
      equals resM1 resM2 <?> "testMultiplyScalarAndAdd m1: " <> show m1 <> " m2: " <> show m2 <> " " <> show s

testNormalFromMat4 :: Effect Unit
testNormalFromMat4 =
  quickCheck \(ArbMat4 m) ->
    let
      resM1 = normalFromMat4 m

      resM2 = fromMat4 $ Mat4.transpose $ Mat4.invert m
    in
      equals resM1 resM2 <?> "testNormalFromMat4 " <> show m

testProjection :: Effect Unit
testProjection =
  quickCheck \w h ->
    let
      resM1 = projection w h

      res = slice 5 10 resM1
    in
      equalArrays res [ 0.0, -1.0, 1.0, 1.0 ] <?> "testProjection " <> show w <> " " <> show h <> " " <> show resM1 <> " " <> show res

testRotate :: Effect Unit
testRotate =
  quickCheck \r (ArbMat3 m) ->
    let
      resM1 = rotate m r

      resM2 = rotate resM1 (negate r)
    in
      equals m resM2 <?> "testRotate " <> show m

testSubtract :: Effect Unit
testSubtract =
  quickCheck \(ArbMat3 m1) (ArbMat3 m2) ->
    equals m1 (subtract (add m1 m2) m2) <?> "testSubtract " <> show m1 <> " " <> show m2

testTranslate :: Effect Unit
testTranslate =
  quickCheck \(ArbMat3 m) (ArbVec2 v) ->
    let
      resM1 = translate m v

      startIndex = 0

      endIndex = 6

      ar1 = slice startIndex endIndex m

      ar2 = slice startIndex endIndex resM1
    in
      ar1 == ar2 <?> "testTranslate " <> show ar1 <> " " <> show ar2

testTranspose :: Effect Unit
testTranspose =
  quickCheck \(ArbMat3 m1) (ArbMat3 m2) ->
    let
      resM1 = transpose $ multiply m1 m2

      resM2 = multiply (transpose m2) (transpose m1)
    in
      resM1 == resM2 <?> "testTranspose " <> show m1 <> " " <> show m2

testExtractNumbers :: Effect Unit
testExtractNumbers =
  quickCheck \(ArbMat3 m1) ->
    let
      ns = numbers m1

      m2 = unsafePartial $ unsafeFromNumbers ns
    in
      equalArrays (numbers m1) ns <?> "testExtractNumbers " <> show m1 <> " != " <> show m2

testFromMat2d :: Effect Unit
testFromMat2d =
  quickCheck \(ArbMat2d m) ->
    let
      r1 = fromMat2d m

      ns = Mat2d.numbers m

      r2 = fromValues (ind ns 0) (ind ns 1) 0.0 (ind ns 2) (ind ns 3) 0.0 (ind ns 4) (ind ns 5) 1.0
    in
      equals r1 r2 <?> "testFromMat2d " <> show r1 <> " " <> show r2
  where
  ind ar i = unsafePartial $ unsafeIndex ar i

testFromQuat :: Effect Unit
testFromQuat =
  quickCheck \(ArbQuat q) ->
    let
      nq = normalize q

      m = fromQuat nq

      q1 = normalize $ Quat.fromMat3 m
    in
      Quat.equals nq q1 <?> "testFromQuat " <> show nq <> " " <> show q1

main :: Effect Unit
main = do
  testAdd
  testNotEqual
  testAdjoint
  testDeterminant
  testFrob
  testFromMat4
  testFromRotation
  testFromScaling
  testFromTranslation
  testMultiply
  testMultiplyDistributivity
  testMultiplyScalar
  testMultiplyScalarAndAdd
  testNormalFromMat4
  testProjection
  testRotate
  testSubtract
  testTranslate
  testTranspose
  testExtractNumbers
  testFromMat2d
  testFromQuat
