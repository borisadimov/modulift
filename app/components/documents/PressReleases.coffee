
{a,div,h1,img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router





DocsList = Exim.createView
  mixins: [Navigation, State, ParseReact.Mixin]

  componentDidMount: ->
    # @transitionTo 'index'

  observe: ->
    docs: (new Parse.Query('document_tbl')).ascending('createdAt')

  goback: ->
    @transitionTo 'index'

  openCurrent: ->
    document.location.href = "/viewer.html?#{@current.link}"

  render: ->
    div className: 'documents',
      div className: 'documents-header',
        div className: 'documents-header-text',
          'Document Browser'
        div className: 'documents-header-goback', onClick: @goback

      div className: 'documents-wrapper',
        div className: 'documents-menu',
          @data.docs.map (doc) ->
            window.doc = doc
            div className: "documents-menu-item", # #{cx 'active': i is 3}
              div className: 'documents-menu-item-icon',
                'PDF'
              div className: 'documents-menu-item-label',
                doc.document_name
                div className: 'documents-menu-item-actions',
                  a className: 'download', src: doc.document.url()


        div className: 'documents-preview',
          div className: 'close'
          div className: 'documents-preview-content', onClick: @openCurrent,
            img src: '/images/preview.jpg'



module.exports = DocsList
