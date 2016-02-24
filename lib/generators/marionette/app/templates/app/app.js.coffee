@<%= name.capitalize %> = do (Backbone, Marionette) ->
  
  App = new Marionette.Application

  App.Routers = {}
  App.Views = {}
  App.Collections = {}
  App.Models = {}
  App.Utils = {}

  App.on 'before:start', ->
    new <%= name.capitalize %>.Utils.Defaults
    new <%= name.capitalize %>.Routers.AppRouter

  App.on 'start', ->
    if Backbone.history
      Backbone.history.start
        pushState: true

  App