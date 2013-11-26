window.App =
  Collections: {}
  Models: {}
  Views: {}
  start: ->
    console.log "App starting..."
    @wordView = new App.Views.Words
      el: $("#word")