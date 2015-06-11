
{div,h1,img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router





InstructionsUK = Exim.createView
  mixins: [Navigation, State]

  componentDidMount: ->
    # @transitionTo 'index'


  render: ->
    div className: 'documents',
      div className: 'documents-header',
        div className: 'documents-header-text'
        div className: 'documents-header-goback'

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
          div className: 'documents-preview-content',
            img src: '/images/preview.jpg'



module.exports = InstructionsUK
