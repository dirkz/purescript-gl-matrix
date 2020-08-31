{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "gl-matrix"
, license = "MIT"
, dependencies =
  [ "console", "effect", "functions", "partial", "psci-support", "quickcheck" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, repository = "https://github.com/dirkz/purescript-gl-matrix.git"
}
