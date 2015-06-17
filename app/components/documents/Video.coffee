
{a,div,h1,img,i,iframe} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router
{addClass, removeClass, toggle} = require 'lib/utils'





Video = Exim.createView
  mixins: [Navigation, State, ParseReact.Mixin]

  current:
    cover: ''
    file: ''
    id: ''

  observe: ->
    videos: (new Parse.Query('video_tbl')).ascending('createdAt')
  goback: ->
    @transitionTo 'index'

  stopVideo: (current) ->
    iframe = $("#vimeo#{current}")[0]

    player = $f(iframe)

    player.api('pause')


  next: ->

    currentIndex = $(".videobox-item.current").data('index')
    @stopVideo(currentIndex)
    length = $('.videobox-item').length

    $(".videobox-item.current").removeClass('current')

    if +currentIndex+1 < +length
      $(".index-#{+currentIndex+1}").addClass 'current'
    else
      $(".index-0").addClass 'current'








  prev: ->

    currentIndex = $(".videobox-item.current").data('index')
    @stopVideo(currentIndex)
    length = $('.videobox-item').length

    $(".videobox-item.current").removeClass 'current'

    if +currentIndex-1 >= 0
      $(".index-#{+currentIndex-1}").addClass 'current'
    else
      $(".index-#{+length-1}").addClass 'current'



  setCurrent: (id) ->
    $(".videobox-item").removeClass 'current'
    $(".id-#{id}").addClass 'current'
    $('.modal-overlay').addClass 'showed'

  closeModal: ->
    currentIndex = $(".videobox-item.current").data('index')
    @stopVideo(currentIndex)
    $('.modal-overlay').removeClass 'showed'


  openCurrent: ->
    document.location.href = "/viewer.html?file=#{@current.file}"

  render: ->
    div className: 'documents',
      div className: 'documents-header',
        div className: 'documents-header-text',
          'Document Browser'
        div className: 'documents-header-goback', onClick: @goback

      div className: 'gallery-wrapper',
        @data.videos.map (video) =>
          div className: 'gallery-item', onClick: @setCurrent.bind(video, video.objectId),
            div className: 'gallery-item-image',
            style:
              'backgroundImage': "url(#{video.thumb_img.url()})"

      div className: 'modal-overlay gallery',
        div className: 'controlls',
          div className: 'left-arrow', onClick: @prev,
            i className: 'ion-chevron-left'
          div className: 'right-arrow', onClick: @next,
            i className: 'ion-chevron-right'
        div className: 'videobox',
          @data.videos.map (video, i) =>
            div className: "videobox-item id-#{video.objectId} index-#{i}", 'data-index': "#{i}",
              iframe id: "vimeo#{i}",
              src: "https://player.vimeo.com/video/#{video.vimeo_url}?byline=0&portrait=0api=1&player_id=vimeo#{i}",
              width: "801",
              height:"451",
              frameBorder: "0",
              allowFullScreen: true

        div className: 'modal-close', onClick: @closeModal








module.exports = Video
