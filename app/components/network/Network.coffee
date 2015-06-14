{div,h1,img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router





Team = Exim.createView
  mixins: [Navigation, State]

  goback: ->
    @transitionTo 'index'

  render: ->
    {network} = require 'config'

    div className: 'network map',
      div className: 'network-header',
        div className: 'network-header-goback', onClick: @goback
        div className: 'network-header-title', onClick: @goback,
          'Our Network'
      div className: 'network-map',
        div className: 'network-map-wrapper',
          div className: 'network-map-container',
            img src: '/images/worldmap.png'

            for point in network
              div className: 'point',
              style: {left:"#{point.x*100}%", top: "#{point.y*100}%"}

      div className: 'network-points',
        div className: 'network-points-wrapper',
          div className: 'network-points-scroller',
            for i in [1..10]
              div className: "network-points-point #{cx 'current': i is 4}",
                div className: 'network-points-point-title',
                  'Safety Technical Serv - Oman'
                div className: 'network-points-point-contact',
                  'Musthafa Rahman'
                div className: 'network-points-point-email',
                  'musthafa@safetyoman.com'
                div className: 'network-points-point-role',
                  'MD'
                div className: 'network-points-point-street',
                  'P.O. Box 3288'
                div className: 'network-points-point-city',
                  'Seeb'
                div className: 'network-points-point-state',
                  'Oman,  PC-111'









module.exports = Team
