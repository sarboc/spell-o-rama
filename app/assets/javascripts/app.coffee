window.App =
  Collections: {}
  Models: {}
  Views: {}
  start: ->
    localStorage.score ?= 0
    console.log "App starting..."
    @wordView = new App.Views.Words
      app: @
    .getWord()
    @navbar = new App.Views.Navbar
      app: @
    .render()
    @results = new App.Views.Results
      app: @
    .render()

_.extend App, Backbone.Events
