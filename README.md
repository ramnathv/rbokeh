## Bokeh R

This is an R binding for the data visualization library [Bokeh](http://bokeh.pydata.org/). It uses the [htmlwidgets](http://github.com/ramnathv/htmlwidgets) framework to allow the visualizations to be used from the R console, embedded in an R Markdown document or as standalone HTML files.

### Installation

```r
library(devtools)
install_github(c('ramnathv/htmlwidgets'), c('ramnathv/rbokeh'))
```

### Get Started

`rbokeh` uses a familiar lattice like formula interface to build interactive plots using [Bokeh](http://bokeh.pydata.org/). Here are a couple of examples to get you started with.


__Example 1__

```r
library(rbokeh)
names(iris) = gsub('\\.', '_', names(iris))
colormap = c(setosa =  'red', versicolor =  'green', virginica = 'blue')
iris2 = transform(iris, 
  colormap = unlist(unname(colormap[iris$Species]))
)
x1 = rbokeh(iris2, Petal_Length ~ Petal_Width, type = 'circle',
  color = 'colormap',
  radius = 5, radius_units = 'screen', fill_alpha = 0.2,
  options = list(
    title = "", xrange = range(iris$Petal_Width),
    yrange = range(iris$Petal_Length)
  )
)
x1
```

__Example 2__


```r
dat = data.frame(
  x = abs(100*rnorm(100)),
  y = abs(100*rnorm(100)),
  radius = 1,
  color = 'blue'
)

opts = list(
  title = "Scatter Demo",
  dims = c(600, 600),
  xrange = range(dat$x),
  yrange = range(dat$y),
  xaxes = "below",
  yaxes = "left",
  tools = TRUE,
  legend = FALSE
)
rbokeh(y ~ x, data = dat, type =  'circle', radius = 'radius',
  radius_units = 'px', fill_color = 'color', fill_alpha = 0.6,
  line_color = NULL, options = opts)
```

