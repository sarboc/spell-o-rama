class App.Views.Words extends App.View
  el: "#word"
  template: JST["templates/word"]

  initialize: ({@app}) ->
    @loading = JST["templates/loading"]
    # @results = JST["templates/results"]
    @newWord = ""
    @url = ""
    @newDefinitions = []

  events:
    "submit form": "checkWord"

  getWord: ->
    @$el.html @loading
    $.post '/words', (data) =>
      @newWord = new App.Models.Word data["word"]
      @url = data["url"]
      @newDefinitions = data["definitions"]
    .done =>
      @render()

  checkWord: (event) ->
    event.preventDefault()
    @guess = $("#guess").val()
    if @guess == @newWord.get "word"
      @newWord.set "correct", 1 + @newWord.get "correct"
      # @score += 1
      localStorage.score = +localStorage.score + 1
      @app.trigger "changeScore"
      @guessCorrect = true
    else
      @newWord.set "incorrect", 1 + @newWord.get "incorrect"
      @guessCorrect = false
    @app.trigger "changeResults", @newWord, @newDefinitions, @guess, @guessCorrect
    @newWord.save().done =>
      @getWord()

  renderLoading: ->
    @$el.html @loading





