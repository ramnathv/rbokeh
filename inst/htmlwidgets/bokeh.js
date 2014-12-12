HTMLWidgets.widget({
  name: "bokeh",
  type: "output",
  renderValue: function(el, payload){
    var plot = Bokeh.Plotting.make_plot.apply(null, payload)
    Bokeh.Plotting.show(plot, el)
  }
})
