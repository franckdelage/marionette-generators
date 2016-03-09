class <%= name.capitalize %>.Views.Layout extends Backbone.Marionette.LayoutView

  template: JST['layouts/layout']
  el: '#frontend-app'

  # regions:

  onRender: ->
    <%= name.capitalize %>.Logger.view 'Rendering main layout view'
