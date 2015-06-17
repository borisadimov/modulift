
{a,div,h1,img,i,iframe} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router
{addClass, removeClass, toggle} = require 'lib/utils'

$ = document.querySelector.bind(document)
$$ = document.querySelectorAll.bind(document)


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

  next: ->

    currentIndex = $(".videobox-item.current").dataset.index
    length = $$('.videobox-item').length

    removeClass $(".videobox-item.current"), 'current'

    if +currentIndex+1 < +length
      addClass $(".index-#{+currentIndex+1}"), 'current'
    else
      addClass $(".index-0"), 'current'



  prev: ->


    currentIndex = $(".videobox-item.current").dataset.index
    length = $$('.videobox-item').length

    removeClass $(".videobox-item.current"), 'current'

    if +currentIndex-1 >= 0
      addClass $(".index-#{+currentIndex-1}"), 'current'
    else
      addClass $(".index-#{+length-1}"), 'current'



  setCurrent: (id) ->
    for item in $$(".videobox-item")
      removeClass item, 'current'

    if $(".id-#{id}")
      addClass $(".id-#{id}"), 'current'

    if $('.modal-overlay')
      addClass $('.modal-overlay'), 'showed'

  closeModal: ->
    if $('.modal-overlay')
      removeClass $('.modal-overlay'), 'showed'


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
              iframe src: "https://player.vimeo.com/video/#{video.vimeo_url}?byline=0&portrait=0",
              width: "801",
              height:"451",
              frameBorder: "0",
              allowFullScreen: true

        div className: 'modal-close', onClick: @closeModal








module.exports = Video
