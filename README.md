# purescript-gl-matrix

Purescript wrapper around glmatrix.net (3.3.0).

For the glmatrix documention, see [here](http://glmatrix.net/docs/). Note that the purescript version uses immutable types, so no `set` functions are offered, and all functions return a new object.

## Important notes

* The API is wrong when you choose MatrixArrayTypeFloat32Array (`Number` vs `Float32`).
  This is not recommended, even though all tests usually run with both versions.
  Recommended: `setMatrixArrayType MatrixArrayTypeArray`.

## What is missing

* Some glmatrix functions could return `null`. That should be reflected in the API. Although that hasn't happened in any of the random tests so far.
* No support for `Quat2`.
* Not all tests cover all the library sources. Some tests exploit special laws (like using `identity`) which may lead to some calculations not being executed.
* The documentation was just pasted from <http://glmatrix.net/docs/index.html>. That could be improved.

Pull requests are welcome. Please be aware of the LICENSE and format your code with `purty`.
