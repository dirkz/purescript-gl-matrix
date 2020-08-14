{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-gl-matrix"
, dependencies =
  [ "console", "effect", "functions", "partial", "psci-support", "quickcheck" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
