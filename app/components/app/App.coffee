authStore = require 'stores/auth'
appStore  = require 'stores/app'

{div,h1} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router


App = Exim.createView
  mixins: [Navigation, State, authStore.connect('loggedIn')]

  componentDidMount: ->
    @transitionTo 'signin' unless @state.loggedIn


  render: ->
    name = @context.router.getCurrentPath()
    div className: 'app',
      div className: "view-wrapper",
        RouteHandler key: name

module.exports = App
