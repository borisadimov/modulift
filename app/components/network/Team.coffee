{div,h1,img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router





Team = Exim.createView
  mixins: [Navigation, State]

  goback: ->
    @transitionTo 'index'

  render: ->
    {team} = require 'config'

    div className: 'network',
      div className: 'network-header',
        div className: 'network-header-goback', onClick: @goback
        div className: 'network-header-title', onClick: @goback,
          'Our People'
      div className: 'network-team',
        for member in team
          div className: 'network-team-member',
            div className: 'network-team-member-avatar',
              img src: member.avatar
            div className: 'network-team-member-name',
              member.name
            div className: 'network-team-member-position',
              member.position
            div className: 'network-team-member-mail',
              member.mail






module.exports = Team
