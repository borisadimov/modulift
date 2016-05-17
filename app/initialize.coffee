{ready} = require 'lib/utils'

ua = window.navigator.userAgent
msie = ua.indexOf("MSIE ")





Exim.DOM['spinner'] = (cls) -> Exim.DOM.div className: "spinner #{cls or ''}", [0...12].map (i) -> Exim.DOM.div(className:"bar#{i+1}", key: i)


console.warn = (text) ->

ready().then ->
  if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))
    document.body.className = 'is_ie'

  appStore = require('stores/app')
  appStore.actions.start()
