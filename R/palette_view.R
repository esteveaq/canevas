#' View a client's color palette
#'
#' @param client Client name
#' @importFrom graphics barplot
#' @export
#'
palette_view <- function(client) {

  colors <- palette_get(client)
  color_names <- names(colors)
  colors <- as.character(colors)

  # Print colors in console
  cat("\n", client, "colors:\n\n")

  for (i in seq_along(colors)) {
    cat(
      sprintf(
        "%-12s %s\n",
        color_names[i],
        colors[i]
      )
    )
  }

  # Plot colors
  graphics::plot(
    seq_along(colors),
    rep(1, length(colors)),
    pch = 15,
    cex = 8,
    col = colors,
    xaxt = "n",
    yaxt = "n",
    xlab = "",
    ylab = ""
  )

  graphics::axis(
    side = 1,
    at = seq_along(colors),
    labels = color_names,
    tick = FALSE
  )
}


