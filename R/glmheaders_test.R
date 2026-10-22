#' Test the Installed GLM Headers
#'
#' Compile and run a small check of GLM vector, matrix, and quaternion operations
#' to verify that the installed headers can be used from C++.
#'
#' @return A single logical value: \code{TRUE} if all numerical checks pass and
#'   \code{FALSE} otherwise. Compilation failures raise an error.
#' @export
#' @details
#' Requires the suggested package \pkg{Rcpp} and a working C++ compiler.
#' The test program is compiled in a temporary directory when this function
#' is called. The package itself remains header only and does not compile a
#' shared library during installation.
#' @examplesIf requireNamespace("Rcpp", quietly = TRUE)
#' # Verify that the installed headers produce the expected geometric results.
#' stopifnot(glmheaders_test())
glmheaders_test = function() {
  if (!requireNamespace("Rcpp", quietly = TRUE)) {
    stop("Package 'Rcpp' is required to run glmheaders_test().", call. = FALSE)
  }
  compiled = new.env()
  Rcpp::sourceCpp(
    system.file(
      "examples",
      "headers.cpp",
      package = "glmheaders",
      mustWork = TRUE
    ),
    env = compiled
  )
  compiled$glmheaders_smoke()
}
