#= require_tree ./templates
#= require jquery
#= require lodash
#= require backbone
#= require app
#= require view
#= require_tree .
#= require_self

# Note: jQuery and Lodash/Underscore must be available before Backbone
# or you'll have prollems

$ ->
  App.start().done ->
    $('#myModal').modal()
   # Start our app when the page is loaded