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
      Parse.initialize("W8qSFepvDbmGlUkeFAq6iS1Mkjvvpi1umKgXEsTm",
                         "VNNRUz21VBZwB4lOdqtyKfVtXuvwz8aCs8p3tg4G")
      new Promise (res,rej) ->
        Parse.User.logIn 'steve', 'testtest',
          success: (user) ->
            window.user = user
            console.log user
            res()
          ,
          error: (user, error) ->
            rej()


    # did: (config) ->
    did: ->
      Routes = require('routes')

      ReactRouter.run Routes,
      # ReactRouter.HistoryLocation,
      (Handler) ->
        React.render React.createElement(Handler, null), document.querySelector('.modulift-app')

