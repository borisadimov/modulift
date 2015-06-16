
{a,div,h1,img,i} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router
{addClass, removeClass, toggle} = require 'lib/utils'

$ = document.querySelector.bind(document)
$$ = document.querySelectorAll.bind(document)


Gallery = Exim.createView
  mixins: [Navigation, State, ParseReact.Mixin]

  current:
    cover: ''
    file: ''
    id: ''

  observe: ->
    photos: (new Parse.Query('image_tbl')).ascending('createdAt')

  goback: ->
    @transitionTo 'index'

  next: ->

    currentIndex = $(".photobox-item.current").dataset.index
    length = $$('.photobox-item').length

    removeClass $(".photobox-item.current"), 'current'

    if +currentIndex+1 < +length
      addClass $(".index-#{+currentIndex+1}"), 'current'
    else
      addClass $(".index-0"), 'current'



  prev: ->


    currentIndex = $(".photobox-item.current").dataset.index
    length = $$('.photobox-item').length

    removeClass $(".photobox-item.current"), 'current'

    if +currentIndex-1 >= 0
      addClass $(".index-#{+currentIndex-1}"), 'current'
    else
      addClass $(".index-#{+length-1}"), 'current'



  setCurrent: (id) ->
    for item in $$(".gallery-item")
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
        @data.photos.map (image) =>
          div className: 'gallery-item', onClick: @setCurrent.bind(image, image.objectId),
            div className: 'gallery-item-image',
            style:
              'backgroundImage': "url(#{image.image_file.url()})"

      div className: 'modal-overlay gallery',
        div className: 'controlls',
          div className: 'left-arrow', onClick: @prev,
            i className: 'ion-chevron-left'
          div className: 'right-arrow', onClick: @next,
            i className: 'ion-chevron-right'
        div className: 'photobox',
          @data.photos.map (image, i) =>
            div className: "photobox-item id-#{image.objectId} index-#{i}", 'data-index': "#{i}",
              img src: image.image_file.url()

        div className: 'modal-close', onClick: @closeModal








        # div className: 'documents-menu',
        #   @data.docs.map (doc) =>
        #     cover = doc.PDF_Coverpage_img.url()
        #     file = doc.document.url()
        #     id = doc.objectId

        #     div className: "documents-menu-item id-#{doc.objectId}", onClick: @setCurrent.bind(doc, id, cover, file),
        #       div className: 'documents-menu-item-icon',
        #         'PDF'
        #       div className: 'documents-menu-item-label',
        #         doc.document_name
        #         div className: 'documents-menu-item-actions',
        #           a className: 'download', href: file

        # div className: 'documents-preview',
        #   div className: 'close'
        #   @data.docs.map (doc) =>
        #     div className: "documents-preview-content id-#{doc.objectId}", onClick: @openCurrent,
        #         img src: doc.PDF_Coverpage_img.url()



module.exports = Gallery
