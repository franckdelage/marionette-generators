class <%= name.capitalize %>.Routers.AppRouter extends Backbone.Marionette.AppRouter

  routes: 
    '': 'index'

  initialize: ->
    @logger = new <%= name.capitalize %>.Utils.Logger
    @logger.router 'Initialize Backbone router'
    @layoutView = new <%= name.capitalize %>.Views.Layout
    <%= name.capitalize %>.rootView = @layoutView
    <%= name.capitalize %>.rootView.render()

  index: ->
    @logger.router 'Call index action'
