class App.Views.Words extends App.View
  initialize: () ->
    @template = JST["templates/word"]
    @newWord = ""
    @url = ""
    @getWord()

  events:
    "submit form": "checkWord"

  getWord: ->
    $.post '/words', (data) =>
      @newWord = new App.Models.Word data["word"]
      @url = data["url"]
    .done =>
      @render()

  checkWord: (event) ->
    event.preventDefault()
    guess = $("#guess").val()
    if guess == @newWord.get "word"
      console.log "correct"
      score = @newWord.get "correct"
      score += 1
      @newWord.set "correct", score
    else
      console.log "incorrect"
      @newWord.set "incorrect", ((@newWord.get "incorrect") + 1)
    @newWord.save().done =>
      console.log "done"
      @getWord()




