module GLMatrix.Vec2.Mix
  ( transformMat2
  , transformMat2d
  , transformMat3
  , transformMat4
  ) where

import Data.Function.Uncurried (Fn2, runFn2)
import GLMatrix.Mat2 (Mat2)
import GLMatrix.Mat2d (Mat2d)
import GLMatrix.Mat3 (Mat3)
import GLMatrix.Mat4 (Mat4)
import GLMatrix.Vec2 (Vec2)

foreign import js_transformMat2 :: Fn2 Vec2 Mat2 Vec2

-- |Transforms the vec2 with a mat2
transformMat2 :: Vec2 -> Mat2 -> Vec2
transformMat2 = runFn2 js_transformMat2

foreign import js_transformMat2d :: Fn2 Vec2 Mat2d Vec2

-- |Transforms the vec2 with a mat2d
transformMat2d :: Vec2 -> Mat2d -> Vec2
transformMat2d = runFn2 js_transformMat2d

foreign import js_transformMat3 :: Fn2 Vec2 Mat3 Vec2

-- |Transforms the vec2 with a mat3
transformMat3 :: Vec2 -> Mat3 -> Vec2
transformMat3 = runFn2 js_transformMat3

foreign import js_transformMat4 :: Fn2 Vec2 Mat4 Vec2

-- |Transforms the vec2 with a mat4
transformMat4 :: Vec2 -> Mat4 -> Vec2
transformMat4 = runFn2 js_transformMat4
