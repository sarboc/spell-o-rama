class App.Views.Words extends App.View
  initialize: () ->
    @score = 0
    @template = JST["templates/word"]
    @loading = JST["templates/loading"]
    @results = JST["templates/results"]
    @navbar = JST["templates/navbar"]
    @newWord = ""
    @url = ""
    @newDefinitions = []
    @getWord()


  events:
    "submit form": "checkWord"

  getWord: ->
    $("#navbar").html @navbar {score: @score}
    $("#results").html @results {lastWord: @lastWord, lastDefinitions: @lastDefinitions, guessCorrect: @guessCorrect, guess: @guess}
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
      @score += 1
      @guessCorrect = true
    else
      @newWord.set "incorrect", 1 + @newWord.get "incorrect"
      @guessCorrect = false
    @lastWord = @newWord
    @lastDefinitions = @newDefinitions
    @newWord.save().done =>
      @getWord()

  renderLoading: ->
    @$el.html @loading





