
{a,div,h1,img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router
{addClass, removeClass, toggle} = require 'lib/utils'





Brochures = Exim.createView
  mixins: [Navigation, State, ParseReact.Mixin]

  current:
    cover: ''
    file: ''
    id: ''

  observe: ->
    alias = @props.params.alias

    docs: (new Parse.Query('document_tbl')).equalTo("Filter", alias).ascending('createdAt')

  goback: ->
    @transitionTo 'index'

  setCurrent: (id, cover, file) ->
    for item in document.querySelectorAll(".documents-menu-item")
      removeClass item, 'current'
    for item in document.querySelectorAll(".documents-preview-content")
      removeClass item, 'current'

    for item in document.querySelectorAll(".id-#{id}")
      addClass item, 'current'



    @current.cover = cover
    @current.file = file
    @current.id = id

  openCurrent: ->
    document.location.href = "/viewer.html?file=#{@current.file}"

  render: ->
    div className: 'documents',
      div className: 'documents-header',
        div className: 'documents-header-text',
          'Document Browser'
        div className: 'documents-header-goback', onClick: @goback

      div className: 'documents-wrapper',
        div className: 'documents-menu',
          @data.docs.map (doc) =>
            cover = doc.PDF_Coverpage_img.url()
            file = doc.document.url()
            id = doc.objectId

            div className: "documents-menu-item id-#{doc.objectId}", onClick: @setCurrent.bind(doc, id, cover, file),
              div className: 'documents-menu-item-icon',
                'PDF'
              div className: 'documents-menu-item-label',
                doc.document_name
                div className: 'documents-menu-item-actions',
                  a className: 'download', href: file

        div className: 'documents-preview',
          div className: 'close'
          @data.docs.map (doc) =>
            div className: "documents-preview-content id-#{doc.objectId}", onClick: @openCurrent,
                img src: doc.PDF_Coverpage_img.url()



module.exports = Brochures
