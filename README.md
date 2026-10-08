# glmheaders

GLM 1.0.1 headers packaged for R under the MIT license. No R functions or
compiled library are provided. The package name distinguishes it from R's
`stats::glm()` function.

Add this to a consuming package's DESCRIPTION:

```
LinkingTo: glmheaders (>= 1.0.1-1)
```

Then use the normal upstream includes:

```cpp
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
```

R supplies the include path during installation; no custom linker flags,
OpenGL installation, or runtime R dependency is needed. Headers are available
at `system.file("include", package = "glmheaders")` for standalone tooling.
GLM configuration macros remain under the consuming package's control.

Source provenance and the unmodified upstream license are installed under
`UPSTREAM.md` and `COPYING`. Compile-and-run smoke tests use the suggested Rcpp
package and exercise vectors, matrix inversion, and quaternions.
