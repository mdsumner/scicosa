#' Primitive from icosa
#'
#' @param x
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' #library(tibble)
#' #library(icosa)
#' #tri <- trigrid()
#' #library(sc)
#' #library(scgraph)
#' #scgraph::as.igraph(PRIMITIVE(tri))
PRIMITIVE.trigrid <- function(x, ...) {
  object = tibble(object_ = sc_uid(1))
  vertex = setNames(as_tibble(x@vertices), c("x_", "y_", "z_"))
  vertex$vertex_ <- rownames(x@vertices)
  segment = setNames(as_tibble(tri@edges), c(".vertex0", ".vertex1"))
 a <- list(object = object, vertex = vertex, segment = segment)
  attr(a, "join_ramp") <- c("object", "path", "path_link_vertex", "vertex")
  class(a) <- c("PRIMITIVE", "sc")
  a
}

