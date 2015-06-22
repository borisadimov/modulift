appStore = require 'stores/app'
store    = require 'stores/auth'

config = require 'config'

Tooltip  = require 'components/elements/Tooltip'

slideAnim = 400
delay = 100
autofocus = false

{cx} = Exim.helpers
{Navigation} = Exim.Router
{div, h2, a, p, form, input, img, icn, button, spinner} = Exim.DOM

Signin = Exim.createView
  mixins: [store.connect('signingIn', 'error', 'loggedIn'), Navigation]

  getInitialState: ->
    prod = config.production
    tooltip: {}
    name: if prod then '' else 'steve'
    password: if prod then '' else 'testtest'

  componentDidMount: ->
    if autofocus
      fn = => @refs.name.getDOMNode().focus()
      setTimeout fn, slideAnim + delay

  shouldComponentUpdate: (nextProps, nextState) ->
    if nextState.error and nextState.error isnt @state.error
      @showTooltip()
    true

  signIn: (e) ->
    event.preventDefault()
    name = @state.name
    password = @state.password
    store.actions.clearError()
    store.actions.signin({name, password})

  showTooltip: ->
    target = @refs.name.getDOMNode()
    position = top: target.offsetTop - 50, left: target.offsetLeft
    @setState tooltip: {type: 'signin_check', position, animate: true}

  hideTooltip: ->
    @setState tooltip: {}

  onChange: (type) -> (evt) =>
    state = {}
    state[type] = evt.currentTarget.value
    @setState state

  render: ->

    form ref: 'form', onSubmit: @signIn,
      h2 className: 'title',
        'Private Login'
      div className: 'input-wrapper name',
        input name: 'name', ref: 'name', type: 'name', placeholder: 'Unique ID', onKeyDown: @hideTooltip, value: @state.name, onChange: @onChange('name')
      div className: 'input-wrapper password',
        input name: 'password', ref: 'password', type: 'Password', placeholder: 'Password', onKeyDown: @hideTooltip, value: @state.password, onChange: @onChange('password')
      input type: 'submit'
      div className: "submit visible #{cx disabled: !(@state.password and @state.name), spinning: @state.signingIn } ", onClick: @signIn,
        if @state.signingIn
          spinner()
        else
          'Sign In'

      div className: 'input-bottom',
        a href: '', onClick: @props.flip, 'Forgotten password?'

      # Tooltip(@state.tooltip)


module.exports = Signin
