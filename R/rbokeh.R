#' Bokeh Plots
#' 
#' @import htmltools
#' @import htmlwidgets
#' @export
rbokeh <- function(data, x, y = NULL, type, 
    width = NULL, height = NULL, options, ...){
  params = getLayer(x = x, y = y, data = data, type = type, ...)
  params$data = NULL
  payload = unname(list(params = params, data = data, options = options))
  htmlwidgets::createWidget('bokeh',
    payload,                        
    package = 'rbokeh'                          
  )
}
