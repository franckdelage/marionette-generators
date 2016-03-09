class <%= name.capitalize %>.Routers.AppRouter extends Backbone.Marionette.AppRouter

  routes: 
    '': 'index'

  initialize: ->
    <%= name.capitalize %>.Logger.router 'Initialize Backbone router'
    @layoutView = new <%= name.capitalize %>.Views.Layout
    <%= name.capitalize %>.rootView = @layoutView
    <%= name.capitalize %>.rootView.render()

  index: ->
    <%= name.capitalize %>.Logger.router 'Call index action'
