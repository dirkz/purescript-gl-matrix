module Test.Arbitrary where

import Prelude
import GLMatrix.Mat2 (Mat2)
import GLMatrix.Mat2 as Mat2
import GLMatrix.Mat2d (Mat2d)
import GLMatrix.Mat2d as Mat2d
import GLMatrix.Mat3 (Mat3)
import GLMatrix.Mat3 as Mat3
import GLMatrix.Mat4 (FieldOfView, Mat4, fieldOfView)
import GLMatrix.Mat4 as Mat4
import GLMatrix.Quat (Quat)
import GLMatrix.Quat as Quat
import GLMatrix.Vec2 (Vec2)
import GLMatrix.Vec2 as Vec2
import GLMatrix.Vec3 (Vec3)
import GLMatrix.Vec3 as Vec3
import GLMatrix.Vec4 (Vec4)
import GLMatrix.Vec4 as Vec4
import Test.QuickCheck (class Arbitrary, arbitrary)

newtype ArbMat2
  = ArbMat2 Mat2

instance arbMat2 :: Arbitrary ArbMat2 where
  arbitrary = ArbMat2 <$> (Mat2.fromValues <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary)

newtype ArbMat2d
  = ArbMat2d Mat2d

instance arbMat2d :: Arbitrary ArbMat2d where
  arbitrary = ArbMat2d <$> (Mat2d.fromValues <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary)

newtype ArbMat3
  = ArbMat3 Mat3

instance arbMat3 :: Arbitrary ArbMat3 where
  arbitrary =
    ArbMat3
      <$> ( Mat3.fromValues
            <$> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
        )

newtype ArbMat4
  = ArbMat4 Mat4

instance arbMat4 :: Arbitrary ArbMat4 where
  arbitrary =
    ArbMat4
      <$> ( Mat4.fromValues
            <$> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
            <*> arbitrary
        )

newtype ArbVec2
  = ArbVec2 Vec2

instance arbVec2 :: Arbitrary ArbVec2 where
  arbitrary = ArbVec2 <$> (Vec2.fromValues <$> arbitrary <*> arbitrary)

newtype ArbVec3
  = ArbVec3 Vec3

instance arbVec3 :: Arbitrary ArbVec3 where
  arbitrary = ArbVec3 <$> (Vec3.fromValues <$> arbitrary <*> arbitrary <*> arbitrary)

newtype ArbVec4
  = ArbVec4 Vec4

instance arbVec4 :: Arbitrary ArbVec4 where
  arbitrary = ArbVec4 <$> (Vec4.fromValues <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary)

newtype ArbFieldOfView
  = ArbFieldOfView FieldOfView

instance arbFieldOfView :: Arbitrary ArbFieldOfView where
  arbitrary =
    ArbFieldOfView
      <$> (fieldOfView <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary)

newtype ArbQuat
  = ArbQuat Quat

instance arbQuat :: Arbitrary ArbQuat where
  arbitrary = ArbQuat <$> (Quat.fromValues <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary)
