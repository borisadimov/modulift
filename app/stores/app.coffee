# request   = require 'lib/request'
# authStore = require 'stores/auth'
config    = require 'config'

module.exports = appStore = Exim.createStore
  actions: [
    'start'
  ]

  initial:
    config: {}
    sidebar: true

  start:
    on: ->
      # request.get('config').then authStore.actions.fetchUser()

    # did: (config) ->
    did: ->
      Routes = require('routes')

      ReactRouter.run Routes,
      # ReactRouter.HistoryLocation,
      (Handler) ->
        React.render React.createElement(Handler, null), document.querySelector('.modulift-app')

