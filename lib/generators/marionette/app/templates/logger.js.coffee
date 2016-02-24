class <%= name.capitalize %>.Utils.Logger extends Backbone.View

  initialize: ->

  router: (text)->
    prefix = console.style.wrap 'router : ', "color:yellow;background-color:magenta;font-style:italic;padding:2px"
    wrap = console.style.wrap text, "color:yellow;background-color:magenta;font-weight:bold;padding:2px"
    console.style prefix + wrap

  view: (text)->
    prefix = console.style.wrap 'view : ', "color:magenta;background-color:yellow;font-style:italic;padding:2px"
    wrap = console.style.wrap text, "color:magenta;background-color:yellow;font-weight:bold;padding:2px"
    console.style prefix + wrap

  specific: (text)->
    prefix = console.style.wrap 'specific : ', "color:green;background-color:white;font-style:italic;padding:2px"
    wrap = console.style.wrap text, "color:green;background-color:white;font-weight:bold;padding:2px"
    console.style prefix + wrap
