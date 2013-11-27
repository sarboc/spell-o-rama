class App.Views.Navbar extends App.View
  template: JST["templates/navbar"]
  el: "#navbar"
  score: 0

  initialize: ({@app}) ->
    @app.on "changeScore", (score) =>
      console.log score
      @score = score
      @render()