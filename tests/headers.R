local({
  # Do not propagate check's relative startup path to the compiler R process.
  old_tests = Sys.getenv("R_TESTS", unset = NA_character_)
  on.exit(
    if (is.na(old_tests)) {
      Sys.unsetenv("R_TESTS")
    } else {
      Sys.setenv(R_TESTS = old_tests)
    }
  )
  Sys.unsetenv("R_TESTS")
  # Keep compiler caches (including macOS xcrun_db) inside a test-owned directory.
  old_tmpdir = Sys.getenv("TMPDIR", unset = NA_character_)
  compiler_tmp = tempfile("header-compiler-")
  dir.create(compiler_tmp)
  on.exit(
    {
      if (is.na(old_tmpdir)) {
        Sys.unsetenv("TMPDIR")
      } else {
        Sys.setenv(TMPDIR = old_tmpdir)
      }
      unlink(compiler_tmp, recursive = TRUE)
    },
    add = TRUE
  )
  Sys.setenv(TMPDIR = compiler_tmp)
  if (requireNamespace("Rcpp", quietly = TRUE)) {
    stopifnot(isTRUE(glmheaders::glmheaders_test()))
  }
})
