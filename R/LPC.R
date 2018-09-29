#' Custom HTML template
#'
#' Loads additional style and template file
#'
#' @param toc should a table of contents be displayed?
#' @param ... additional arguments provided to \@code{html_document}
#' @export
#'
LPC = function(toc = TRUE, ...) {

  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "LPC")
  }

  css    = pkg_resource("rmarkdown/resources/LPC.css")
  footer = pkg_resource("rmarkdown/resources/footer.html")
  header = pkg_resource("rmarkdown/resources/header.html")

  # call the base html_document function
  rmarkdown::html_document(
    toc = toc,
    toc_float = TRUE,
    fig_width = 6.5,
    fig_height = 4,
    theme = "flatly",
    code_folding = "hide",
    css = css,
    number_sections = FALSE,
    includes = rmarkdown::includes(before_body = header,
                                   after_body = footer),
    ...
  )
}
