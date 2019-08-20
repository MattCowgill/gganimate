# Convenience function(s) that can be optionally supplied to the
# `frame_modifier` argument of `animate()`


#' Align labels with outer edge of the image in a gganimate animation
#'
#' The function takes a gtable object and returns a gtable object,
#' with the title, subtitle, and caption aligned to the outer boundary of the image.
#' This function is not intended to be called directly - it is intended to be
#' supplied to the `frame_modifier` argument of `animate()`.
#'
#' @param plot a plot formatted as a gtable
#'
#' @return a plot formatted as a gtable
#'
#' @export
#' @examples
#'
#' plot <- ggplot(mtcars, aes(x = wt, y = mpg)) +
#'    geom_point() +
#'    labs(title = "Title",
#'         subtitle = "Subtitle",
#'         caption = "Caption")
#'
#' anim_plot <- plot +
#'    transition_states(gear, transition_length = 2, state_length = 1) +
#'    enter_fade() +
#'    exit_fade()
#'
#' \dontrun{animate(anim_plot, frame_modifier = outer_align)}
#'

# This function aligns title, subtitle, and caption with the boundary of the
# image, not the boundary of the plotting area

outer_align <- function(plot) {

  plot$layout$l[plot$layout$name %in% c("title", "subtitle", "caption")] <- 1

  plot
}
