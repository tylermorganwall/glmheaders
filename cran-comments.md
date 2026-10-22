## Resubmission

Thank you for reviewing the submission. The following changes address the
review comments:

1. Software and programming language names remain single-quoted in the Title
   and Description. Quotes around the acronym GLM have been removed; it is
   expanded as 'OpenGL Mathematics' on first use.

2. The exported glmheaders_test() function now has a small executable example
   in man/glmheaders_test.Rd: stopifnot(glmheaders_test()). It compiles and runs
   a C++ program that calls the GLM API for vector operations, matrix inversion,
   and quaternion rotation. The example runs when the suggested Rcpp package
   is available and requires a working C++ compiler. It is not wrapped in
   dontrun or donttest, and the same function is exercised by the package tests.

3. The package is fully developed for its intended purpose. Its minimal R
   interface is intentional: glmheaders is a header-only package that supplies
   the complete GLM 1.0.1 headers to other R packages through LinkingTo.
   It does not install a compiled library or aim to provide a general R
   interface to GLM. No additional functionality is planned for this submission.

## Check results

2026-10-21: R 4.6.0, macOS arm64, R CMD check --as-cran --no-manual:
0 errors, 0 warnings, 0 NOTEs.