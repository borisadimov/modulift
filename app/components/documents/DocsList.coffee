
{div,h1,img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router





DocsList = Exim.createView
  mixins: [Navigation, State]

  componentDidMount: ->
    # @transitionTo 'index'

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
          for i in [1..5]
            div className: "documents-menu-item #{cx 'active': i is 3}",
              div className: 'documents-menu-item-icon',
                'DOC'
              div className: 'documents-menu-item-label',
                'Document Name'
                div className: 'documents-menu-item-actions',
                  div className: 'download'

          for [1..10]
            div className: 'documents-menu-item',
              div className: 'documents-menu-item-icon',
                'DOC'
              div className: 'documents-menu-item-label',
                'Document Name'
                div className: 'documents-menu-item-actions',
                  div className: 'download'


        div className: 'documents-preview',
          div className: 'close'
          div className: 'documents-preview-content', onClick: @openCurrent,
            img src: '/images/preview.jpg'



module.exports = DocsList
