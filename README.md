# purescript-gl-matrix

Purescript wrapper around glmatrix.net (3.3.0).

For the glmatrix documention, see [here](http://glmatrix.net/docs/). Note that the purescript version uses immutable types, so no `set` functions are offered, and all functions return a new object.

## Important Notes

* The API is wrong when you choose MatrixArrayTypeFloat32Array (`Number` vs `Float32`).
  This is not recommended, even though all tests usually run with both versions.
  Recommended: `setMatrixArrayType MatrixArrayTypeArray`.
  
## Quick Start

```
npm install
spago -x test.dhall test
```

## What is missing

* Some glmatrix functions could return `null`. That should be reflected in the API. Although that hasn't happened in any of the random tests so far.
* No support for `Quat2`.
* Not all tests cover all the library sources. Some tests exploit special laws (like using `identity`) which may lead to some calculations not being executed.
* The documentation was just pasted from <http://glmatrix.net/docs/index.html>. That could be improved.

Pull requests are welcome. Please be aware of the LICENSE and format your code with `purty`.

## Author's Notes

### Updating the package on pursuit

The process looks like this:

```
# Check the created documentation, improve it if needed.
# Note: You need bower.json to do that, in case you deleted that (see the next step).
pulp docs -- --format html

# Create (update) a bower.json, create the next version tag.
spago bump-version minor --no-dry-run

# Log into github
pulp login

# Push the package to pursuit, push the tags.
pulp publish
```
