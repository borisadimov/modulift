# authStore = require 'stores/auth'
appStore  = require 'stores/app'

# LeftSidebar = require './LeftSidebar'

{div,h1} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router


App = Exim.createView
  mixins: [Navigation, State]

  componentDidMount: ->
    # @transitionTo if @state.loggedIn then 'appointments' else 'signin'
    @transitionTo 'index'


  render: ->
    name = @context.router.getCurrentPath()
    div className: 'app',
      div className: "view-wrapper",
        RouteHandler key: name

module.exports = App
