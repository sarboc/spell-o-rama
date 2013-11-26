class App.View extends Backbone.View
  initialize: (opts) ->
    _.forOwn opts, (val, key) =>
      @[key] = val

  render: ->
    # Return ourself for chaining
    _.tap @, =>
      @$el.html @template @