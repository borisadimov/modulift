{cx} = Exim.helpers
{div, span, ul, li, icn} = Exim.DOM

BaseTooltip = Exim.createView
  getInitialState: ->
    visible: !@props.animate

  propTypes:
    matches: React.PropTypes.object
    type: React.PropTypes.string

  signin_check: ->
    div null,
      'Oops. Invalid email/password combination.'

  email_check: ->
    div null,
      'This email already in use!'

  email_validate: ->
    div null,
      'Please, use correct email format.'

  password: (style) ->
    matches = @props.matches

    matched = (match, title) ->
      li className: cx(matched: match),
        if match then icn 'ios-checkmark-empty'
        title

    div null,
      span 'Password must have at least'
      ul null,
        matched matches.characters, '8 characters'
        matched matches.lowerCase,  '1 lowercase letter'
        matched matches.upperCase,  '1 uppercase letter'
        matched matches.number,     '1 number'

  render: ->
    style = @props.position or {}
    div className: "tooltip #{cx visible: @props.type}", style: style,
      @[@props.type]() if @props.type

module.exports = BaseTooltip
