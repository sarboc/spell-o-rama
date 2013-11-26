window.App =
  Collections: {}
  Models: {}
  Views: {}
  start: ->
    console.log "App starting..."
    @word = new App.Collections.Words
    $.post '/words/create', (word) ->
      word = new App.Models.Word word
      word.get 'whatever'