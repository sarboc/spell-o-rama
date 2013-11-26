class App.Views.Words extends App.View
  initialize: () ->
    @template = JST["templates/word"]
    @newWord = ""
    @url = ""
    @getWord()

  events:
    "new": "getWord"

  getWord: ->
    $.post '/words', (data) =>
      @newWord = new App.Models.Words data["word"]
      @url = data["url"]
      console.log @url
      console.log @newWord.get "word"
      # @newWord = newWord.models[0]
    .done =>
      console.log "done"
      @render()



