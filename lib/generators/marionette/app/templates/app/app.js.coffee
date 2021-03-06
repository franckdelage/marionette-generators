@<%= name.capitalize %> = do (Backbone, Marionette) ->
  
  App = new Marionette.Application

  App.Routers = {}
  App.Views = {}
  App.Regions = {}
  App.Behaviors = {}
  App.Collections = {}
  App.Models = {}
  App.Utils = {}

  App.on 'before:start', ->
    <%= name.capitalize %>.Logger = new <%= name.capitalize %>.Utils.Logger
    new <%= name.capitalize %>.Utils.Defaults
    new <%= name.capitalize %>.Routers.AppRouter

  App.on 'start', ->
    if Backbone.history
      Backbone.history.start
        pushState: true

  App