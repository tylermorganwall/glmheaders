# glmheaders

GLM 1.0.1 headers packaged for R under the MIT license. No compiled library
is installed. The package name distinguishes it from R's
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
`COPYRIGHTS` and `COPYING`. With the suggested Rcpp package and a working C++
compiler, run the following to compile and exercise vectors, matrix inversion,
and quaternions using the installed headers:

```r
glmheaders::glmheaders_test()
```

The function returns `TRUE` when all numerical checks pass. This small testing
interface is the only exported R function; the package primarily supplies
headers for other packages.
