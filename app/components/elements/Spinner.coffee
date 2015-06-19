{div, span, spinner} = Exim.DOM

Spinner = Exim.createView
  displayName: 'spinner'
  propTypes:
    state: React.PropTypes.bool

  render: ->
    {children} = @props

    args =
      if @props.state
        div className: 'app-spinner-outer',
          spinner()
      else if React.Children.count(children) is 0
        div className: 'app-spinner-outer',
          @props.ifEmpty
      else
        children

    if @props.outer
      @props.outer args
    else
      div className: "app-spinner-outer-content #{@props.className or ''}", args

module.exports = Spinner
