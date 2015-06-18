{div, h1, h2, a, button, img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler, Link} = Exim.Router
{addClass, removeClass, toggle} = require 'lib/utils'

Login = require './Login'
Forgot = require './Forgot'

config = require 'config'

animDuration = 400


Index = Exim.createView
  mixins: [Navigation, State]

  getInitialState: ->
    flipped: false

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
