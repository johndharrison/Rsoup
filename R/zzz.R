#' @import rJava
require(rJava)
.jpackage(name = 'jsoupr', jars = "*")

.onLoad <- function(libname, pkgname) {
# load the jsoup jar
  library(rJava)
  .jpackage(name = pkgname, jars = "*")
}

.onAttach <- function(libname, pkgname) {
  # load the jsoup jar
  library(rJava)
  .jpackage(name = pkgname, jars = "*")
}