\name{glmheaders-package}
\alias{glmheaders}
\alias{glmheaders-package}
\docType{package}
\title{OpenGL Mathematics C++ Headers}
\description{
Provides GLM 1.0.1 headers for C++ vector, matrix, quaternion, and geometric
computations. No R functions or compiled library are provided.
}
\details{
Add \code{glmheaders} to the \code{LinkingTo} field of a consuming package's
DESCRIPTION file and include \code{<glm/glm.hpp>} in its C++ source.
The include directory can also be located with
\code{system.file("include", package = "glmheaders")}.
An OpenGL installation is not required. The MIT license option is used.
}
\references{\url{https://github.com/g-truc/glm}}
\author{G-Truc Creation (GLM); Tyler Morgan-Wall (R packaging).}
\keyword{package}
