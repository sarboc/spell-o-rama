class App.Views.Navbar extends App.View
  template: JST["templates/navbar"]
  el: "#navbar"
  score: localStorage.score

  initialize: ({@app}) ->
    @app.on "changeScore", =>
      # console.log score
      @score = localStorage.score
      @render()