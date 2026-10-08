#include <Rcpp.h>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/quaternion.hpp>
#include <cmath>

// [[Rcpp::depends(glmheaders)]]
// [[Rcpp::export]]
bool glmheaders_smoke() {
  const glm::vec3 x(1, 0, 0), y(0, 1, 0), z(0, 0, 1);
  if (glm::length(glm::cross(x, y) - z) > 1e-6f) return false;
  if (glm::dot(x, y) != 0) return false;
  if (std::abs(glm::length(glm::normalize(glm::vec3(3, 4, 0))) - 1) > 1e-6f)
    return false;
  const auto matrix = glm::scale(glm::translate(glm::mat4(1), glm::vec3(2, -3, 5)),
                                 glm::vec3(2, 3, 4));
  const auto identity = glm::inverse(matrix) * matrix;
  for (int i = 0; i < 4; ++i)
    for (int j = 0; j < 4; ++j)
      if (std::abs(identity[i][j] - (i == j ? 1.f : 0.f)) > 1e-6f) return false;
  const auto rotation = glm::angleAxis(1.5707963267948966f, z);
  return glm::length(rotation * x - y) < 1e-6f;
}
