store    = require 'stores/auth'
appStore = require 'stores/app'

{div, h1, h2, a, button, img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler, Link} = Exim.Router
{addClass, removeClass, toggle} = require 'lib/utils'

Login = require './Login'
Forgot = require './Forgot'

config = require 'config'

animDuration = 400


Index = Exim.createView
  name: 'flipped'
  staticView: true
  noHeader: true
  fadeIn: true
  mixins: [store.connect('error', 'loggedIn'), Navigation]
  statics:
    willTransitionTo: (transition) ->
      transition.redirect('app') if store.get('loggedIn')

  getInitialState: ->
    flipped: false

  flip: (evt) ->
    evt.preventDefault()
    @setState flipped: !@state.flipped

  componentDidUpdate: ->
    if @state.error
      container = @refs['container'].getDOMNode()
      container.classList.add('shake')
      setTimeout((=> container.classList.remove('shake')), animDuration)
    else
      if @state.loggedIn
        @transitionTo('index')

  render: ->

    {nav} = config
    div className: 'login',
      div className: 'logotype',
        div className: 'logotype-img',
          img src: '/images/modulift-logo.png'
        div className: 'logotype-link',
          'Visit ',
          a href: "#", 'www.modulift.com'


      div className: 'flipped auth',
        div className: 'flipped-inner',
          div className: cx('flipped-container': true, flipped: @state.flipped), ref: 'container',
            div className: 'flipped-card',
              div className: 'flipped-front',
                Login {@flip, animDuration, disabled: @state.flipped}
              # div className: 'flipped-back',
              #   Forgot {@flip, animDuration, disabled: !@state.flipped}




module.exports = Index
