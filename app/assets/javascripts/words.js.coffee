class App.Models.Words extends Backbone.Model
  urlRoot: "/words"

  initialize: (attrs) ->
    @correct = attrs.correct
    @incorrect = attrs.incorrect
    @word = attrs.word
    @percent = attrs.percent
