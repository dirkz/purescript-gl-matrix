module Test.TestMat4 where

import Test.Arbitrary
import Data.Foldable (maximum, sum)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import GLMatrix (equalArrays, toRadian)
import GLMatrix as GLMatrix
import GLMatrix.Mat4 (Mat4, add, adjoint, determinant, equals, frob, fromRotation, fromScaling, fromTranslation, fromXRotation, fromYRotation, fromZRotation, frustum, identity, invert, lookAt, multiply, multiplyScalar, multiplyScalarAndAdd, numbers, ortho, perspective, perspectiveFromFieldOfView, rotate, rotateX, rotateY, rotateZ, scale, slice, subtract, translate, transpose, unsafeFromNumbers)
import GLMatrix.Mat4 as Mat4
import GLMatrix.Mat4.Mix (fromQuat, fromRotationTranslation, fromRotationTranslationScale, fromVec4)
import GLMatrix.Quat as Quat
import GLMatrix.Vec3 as Vec3
import Math (sqrt)
import Math as Math
import Partial.Unsafe (unsafePartial)
import Prelude (Unit, discard, map, negate, show, ($), (&&), (*), (+), (/), (/=), (<), (<>), (==))
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
      equals (adjoint m) m2 <?> "testAdjoint " <> show n

testDeterminant :: Effect Unit
testDeterminant =
  quickCheck \(ArbVec4 v) ->
    GLMatrix.equals (determinant $ fromVec4 v v v v) 0.0

testFrob :: Effect Unit
testFrob =
  quickCheck \(ArbMat4 m) ->
    let
      theFrob = frob m

      theSum = sqrt $ sum (map (\n -> n * n) (numbers m))
    in
      GLMatrix.equals theFrob theSum <?> "testFrob " <> show m <> " frob " <> show theFrob <> " sum " <> show theSum

testFromRotation :: Effect Unit
testFromRotation =
  quickCheck \r (ArbVec3 v) ->
    equals (fromRotation r v) (rotate identity r v) <?> "testFromRotation " <> show r

testFromScaling :: Effect Unit
testFromScaling =
  quickCheck \(ArbVec3 v) ->
    equals (fromScaling v) (scale identity v) <?> "testFromScaling " <> show v

testFromTranslation :: Effect Unit
testFromTranslation =
  quickCheck \(ArbVec3 v) ->
    equals (fromTranslation v) (translate identity v) <?> "testFromTranslation " <> show v

testFromXRotation :: Effect Unit
testFromXRotation =
  quickCheck \r ->
    equals (fromXRotation r) (rotateX identity r) <?> "testFromXRotation " <> show r

testFromYRotation :: Effect Unit
testFromYRotation =
  quickCheck \r ->
    equals (fromYRotation r) (rotateY identity r) <?> "testFromYRotation " <> show r

testFromZRotation :: Effect Unit
testFromZRotation =
  quickCheck \r ->
    equals (fromZRotation r) (rotateZ identity r) <?> "testFromZRotation " <> show r

testFrustum :: Effect Unit
testFrustum =
  quickCheck \left right bottom top near far ->
    let
      theFrustum = frustum left right bottom top near far

      sl15 = slice 1 5 theFrustum

      sl68 = slice 6 8 theFrustum

      sl1114 = slice 11 14 theFrustum
    in
      sl15 == [ 0.0, 0.0, 0.0, 0.0 ]
        && sl68
        == [ 0.0, 0.0 ]
        && sl1114
        == [ -1.0, 0.0, 0.0 ]
        <?> "testFrustum "
        <> show [ left, right, bottom, top, near, far ]
        <> " -> "
        <> show theFrustum
        <> " "
        <> show sl15
        <> " "
        <> show sl68
        <> " "
        <> show sl1114

testInvert :: Effect Unit
testInvert =
  quickCheck \(ArbMat4 m) ->
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

  maxDiff :: Mat4 -> Mat4 -> Number
  maxDiff m1 m2 = case maximum $ map Math.abs $ numbers $ subtract m1 m2 of
    Just d -> d
    Nothing -> maxAllowedDiff

testLookAt :: Effect Unit
testLookAt =
  quickCheck \(ArbVec3 eye) (ArbVec3 center) (ArbVec3 up) ->
    let
      res = lookAt eye center up
    in
      slice 3 4 res == [ 0.0 ]
        && slice 7 8 res
        == [ 0.0 ]
        && slice 11 12 res
        == [ 0.0 ]
        && slice 15 16 res
        == [ 1.0 ]
        <?> "testLookAt "
        <> show eye
        <> " "
        <> show center
        <> " "
        <> show up
        <> " -> "
        <> show res

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

testMultiplyScalar :: Effect Unit
testMultiplyScalar =
  quickCheck \(ArbMat4 m) s ->
    let
      resM1 = multiplyScalar m s

      resM2 = Mat4.map (\n -> n * s) m
    in
      resM1 == resM2 <?> "testMultiplyScalar " <> show m <> " " <> show s

testMultiplyScalarAndAdd :: Effect Unit
testMultiplyScalarAndAdd =
  quickCheck \(ArbMat4 m1) (ArbMat4 m2) s ->
    let
      resM1 = multiplyScalarAndAdd m1 m2 s

      resM2 = add m1 (multiplyScalar m2 s)
    in
      equals resM1 resM2 <?> "testMultiplyScalarAndAdd " <> show m1 <> " " <> show m2 <> " " <> show s

testOrtho :: Effect Unit
testOrtho =
  quickCheck \left right bottom top near far ->
    let
      resM1 = ortho left right bottom top near far
    in
      slice 1 5 resM1 == [ 0.0, 0.0, 0.0, 0.0 ]
        && slice 6 8 resM1
        == [ 0.0, 0.0 ]
        && slice 11 14 resM1
        == [ -1.0, 0.0, 0.0 ]
        <?> "testOrtho "
        <> show [ left, right, bottom, top, near, far ]
        <> " -> "
        <> show resM1

testPerspective :: Effect Unit
testPerspective =
  quickCheck \fovy aspect near far ->
    let
      resM1 = perspective fovy aspect near far
    in
      slice 1 5 resM1 == [ 0.0, 0.0, 0.0, 0.0 ]
        && slice 6 8 resM1
        == [ 0.0, 0.0 ]
        && slice 11 14 resM1
        == [ -1.0, 0.0, 0.0 ]
        <?> "testPerspective "
        <> show [ fovy, aspect, near, far ]
        <> " -> "
        <> show resM1

testPerspectiveFromFieldOfView :: Effect Unit
testPerspectiveFromFieldOfView =
  quickCheck \(ArbFieldOfView fov) near far ->
    let
      resM1 = perspectiveFromFieldOfView fov near far
    in
      slice 1 5 resM1 == [ 0.0, 0.0, 0.0, 0.0 ]
        && slice 6 8 resM1
        == [ 0.0, 0.0 ]
        && slice 11 14 resM1
        == [ -1.0, 0.0, 0.0 ]
        <?> "testPerspectiveFromFieldOfView "
        <> show resM1

testRotateX :: Effect Unit
testRotateX =
  quickCheck \(ArbMat4 m) r ->
    rotateX m r == rotate m r (Vec3.fromValues 1.0 0.0 0.0)
      <?> "testRotateX "
      <> show m
      <> " "
      <> show r

testRotateY :: Effect Unit
testRotateY =
  quickCheck \(ArbMat4 m) r ->
    rotateY m r == rotate m r (Vec3.fromValues 0.0 1.0 0.0)
      <?> "testRotateY "
      <> show m
      <> " "
      <> show r

testRotateZ :: Effect Unit
testRotateZ =
  quickCheck \(ArbMat4 m) r ->
    rotateZ m r == rotate m r (Vec3.fromValues 0.0 0.0 1.0)
      <?> "testRotateZ "
      <> show m
      <> " "
      <> show r

testSubtract :: Effect Unit
testSubtract =
  quickCheck \(ArbMat4 m1) (ArbMat4 m2) ->
    equals m1 (subtract (add m1 m2) m2) <?> "testSubtract " <> show m1 <> " " <> show m2

testTargetTo :: Effect Unit
testTargetTo =
  quickCheck \(ArbVec3 eye) (ArbVec3 center) (ArbVec3 up) ->
    let
      res = lookAt eye center up
    in
      slice 3 4 res == [ 0.0 ]
        && slice 7 8 res
        == [ 0.0 ]
        && slice 11 12 res
        == [ 0.0 ]
        && slice 15 16 res
        == [ 1.0 ]
        <?> "testTargetTo "
        <> show eye
        <> " "
        <> show center
        <> " "
        <> show up
        <> " -> "
        <> show res

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
      equalArrays (numbers m1) ns <?> "testExtractNumbers " <> show m1 <> " != " <> show m2

testFromQuatWithXRotation :: Effect Unit
testFromQuatWithXRotation =
  quickCheck \d ->
    let
      q = Quat.fromEuler d 0.0 0.0

      m1 = fromXRotation (toRadian d)

      m2 = fromQuat q
    in
      equals m1 m2 <?> "testFromQuatWithXRotation " <> show m1 <> " " <> show m2

testFromQuatWithYRotation :: Effect Unit
testFromQuatWithYRotation =
  quickCheck \d ->
    let
      q = Quat.fromEuler 0.0 d 0.0

      m1 = fromYRotation (toRadian d)

      m2 = fromQuat q
    in
      equals m1 m2 <?> "testFromQuatWithYRotation " <> show m1 <> " " <> show m2

testFromQuatWithZRotation :: Effect Unit
testFromQuatWithZRotation =
  quickCheck \d ->
    let
      q = Quat.fromEuler 0.0 0.0 d

      m1 = fromZRotation (toRadian d)

      m2 = fromQuat q
    in
      equals m1 m2 <?> "testFromQuatWithZRotation " <> show m1 <> " " <> show m2

testFromRotationTranslation :: Effect Unit
testFromRotationTranslation =
  quickCheck \(ArbQuat q) (ArbVec3 v) ->
    let
      r1 = fromRotationTranslation q v

      mTranslation = translate identity v

      mRotation = fromQuat q

      r2 = multiply mTranslation mRotation
    in
      equals r1 r2 <?> "testFromRotationTranslation " <> show r1 <> " " <> show r2

testFromRotationTranslationScale :: Effect Unit
testFromRotationTranslationScale =
  quickCheck \(ArbQuat q) (ArbVec3 v) (ArbVec3 s) ->
    let
      r1 = fromRotationTranslationScale q v s

      mTranslation = translate identity v

      mRotation = fromQuat q

      mRotationTranslation = multiply mTranslation mRotation

      r2 = scale mRotationTranslation s
    in
      equals r1 r2 <?> "testFromRotationTranslationScale " <> show r1 <> " " <> show r2

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
  testFrustum
  testInvert
  testLookAt
  testMultiply
  testMultiplyDistributivity
  testMultiplyScalar
  testMultiplyScalarAndAdd
  testOrtho
  testPerspective
  testPerspectiveFromFieldOfView
  testRotateX
  testRotateY
  testRotateZ
  testSubtract
  testTargetTo
  testTranspose
  testExtractNumbers
  testFromQuatWithXRotation
  testFromQuatWithYRotation
  testFromQuatWithZRotation
  testFromRotationTranslation
  testFromRotationTranslationScale
