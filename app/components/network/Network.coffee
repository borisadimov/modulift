{div,h1,img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router





Team = Exim.createView
  mixins: [Navigation, State, ParseReact.Mixin]

  current:
    cover: ''
    file: ''
    id: ''

  getInitialState: ->
    scrolling: false


  setCurrent: (id) ->

    unless @state.scrolling
      @setState('scrolling': true)
      $(".map-point, .network-points-point").removeClass('current')

      $(".#{id}").addClass('current')



      $('.network-points-wrapper').scrollTo $(".network-points-scroller .#{id}")
      , 600, onAfter: =>
        @setState('scrolling': false)




  observe: ->
    points: (new Parse.Query('Our_Network_tbl')).ascending('createdAt')


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
            div className: 'network-map-points',
              img src: '/images/worldmap.png'
              @data.points.map (point) =>
                div className: "map-point id-#{point.objectId}", onClick: @setCurrent.bind(point,"id-#{point.objectId}"),
                style: {left:"#{point.Position_X*100}%", top: "#{point.Position_Y*100}%"}

      div className: 'network-points',
        div className: 'network-points-wrapper',
          div className: 'network-points-scroller',
            @data.points.map (point) =>
              div className: "network-points-point id-#{point.objectId}", onClick: @setCurrent.bind(point,"id-#{point.objectId}"),
                div className: 'network-points-point-title',
                  point.Title
                div className: 'network-points-point-contact',
                  point.Contact
                div className: 'network-points-point-email',
                  point.Email
                div className: 'network-points-point-role',
                  point.Role
                div className: 'network-points-point-street',
                  point.Street
                div className: 'network-points-point-city',
                  point.City
                div className: 'network-points-point-state',
                  point.State
                div className: 'network-points-point-phone',
                  point.PhoneNumber









module.exports = Team
