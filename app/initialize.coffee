{ready} = require 'lib/utils'

Exim.DOM['spinner'] = (cls) -> Exim.DOM.div className: "spinner #{cls or ''}", [0...12].map (i) -> Exim.DOM.div(className:"bar#{i+1}", key: i)


console.warn = (text) ->

ready().then ->
  appStore = require('stores/app')
  appStore.actions.start()
