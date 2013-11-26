class App.Views.Words extends App.View
  initialize: () ->
    @template = JST["templates/word"]
    @newWord = ""
    @url = ""
    @newDefinitions = []
    @getWord()
    @score = 0

  events:
    "submit form": "checkWord"

  getWord: ->
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




