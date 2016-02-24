class <%= name.capitalize %>.Views.Layout extends Backbone.Marionette.LayoutView

  template: JST['layouts/layout']
  el: '#frontend-app'

  # regions:

  initialize: ->
    @logger = new <%= name.capitalize %>.Utils.Logger

  onRender: ->
    @logger.view 'Rendering main layout view'
