{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "gl-matrix"
, license = "MIT"
, dependencies =
  [ "arrays"
  , "effect"
  , "foldable-traversable"
  , "functions"
  , "numbers"
  , "partial"
  , "prelude"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, repository = "https://github.com/dirkz/purescript-gl-matrix.git"
}
