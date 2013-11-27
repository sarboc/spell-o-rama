class App.Views.Results extends App.View
  template: JST["templates/results"]
  el: "#results"

  initialize: ({@app}) ->
    @app.on "changeResults", (word, definitions, guess, correct) =>
      @word = word
      @definitions = definitions
      @guess = guess
      @correct = correct
      @render()

