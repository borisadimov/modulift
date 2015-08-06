{div,h1,img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router





Team = Exim.createView
  mixins: [Navigation, State, ParseReact.Mixin]

  mailto: (mail) ->
    document.location.href = "mailto:#{mail}"

  observe: ->

    team: (new Parse.Query('Person')).ascending('order_index')



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
        for member in @data.team
          div className: 'network-team-member', onClick: @mailto.bind(member, member.email),
            div className: 'network-team-member-avatar',
              img src: member.avatarImage.url()
            div className: 'network-team-member-name',
              member.firstName
              member.surame
            div className: 'network-team-member-position',
              member.jobTitle






module.exports = Team
