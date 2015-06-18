store = require 'stores/auth'

{div, h1, p, input, a, form} = Exim.DOM

Forgot = Exim.createView
  getInitialState: -> sent: false

  sendForgot: (e) ->
    e.preventDefault()
    email = @refs.email.getDOMNode().value
    store.actions.forgot(email).then =>
      @setState sent: true

  flip: (evt) ->
    @props.flip(evt)
    setTimeout @refreshSent, @props.animDuration

  refreshSent: ->
    @setState sent: false

  render: ->
    form onSubmit: @sendForgot,
      unless @state.sent
        [
          h1 'Forgot your password, eh?'
          p "We'll send a password reset to you:"
          div className: 'input-wrapper email',
            input ref: 'email', type: 'email', placeholder: 'Email'
        ]
      else
        [
          h1 'Password reset request sent'
          p "Please check your email and click the link to finish resetting your password. If you don't receive the message in a few minutes, please check your spam folder."
        ]
      div className: 'spacer'
      div className: 'input-bottom',
        a href: '', onClick: @flip, 'Back to Sign In'

module.exports = Forgot
