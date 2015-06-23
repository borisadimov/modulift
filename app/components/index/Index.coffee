{div, h1, h2, a, button, img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router
{addClass, removeClass, toggle} = require 'lib/utils'

$ = document.querySelector.bind(document)
$$ = document.querySelectorAll.bind(document)


config = require 'config'
ReactCSSTransitionGroup = require('lib/react-addons').addons.CSSTransitionGroup




Index = Exim.createView
  mixins: [Navigation, State]

  getInitialState: ->
    return { modalIsOpen: false }

  openModal: (name) ->
    if $('.modal-overlay') and $(".modal-overlay .modal-#{name}")
      addClass $('.modal-overlay'), 'showed'
      addClass $(".modal-overlay .modal-#{name}"), 'showed'


  closeModal: ->
    if $('.modal-overlay')

      removeClass $('.modal-overlay'), 'showed'
      for modal in $$(".modal-overlay .index-modal")
        removeClass modal, 'showed'

  mailto: ->
    document.location.href = 'mailto:xyz@something.com'

  team: ->
    @transitionTo 'team'

  navigate: (alias) ->
    if alias.indexOf('message') > -1
      document.location.href = 'mailto:xyz@something.com'
    else
      if alias.split('/').length > 1
        @transitionTo alias.split('/')[0], { alias: alias.split('/')[1]}
      else
        @transitionTo alias

  render: ->

    {nav} = config


    menu = nav.map (item) =>
      clickHandler = @openModal.bind(item, item.alias)
      if item.alias is 'team'
        clickHandler = @team
      if item.alias is 'message'
        clickHandler = @mailto

      div className: 'index-menu-item', onClick: clickHandler,
        div className: 'index-menu-item-icon',
          img src: "/images/icon-#{item.alias}-s.png"
        div className: 'index-menu-item-label',
          item.title

    modals = nav.map (item) =>
      div className: "index-modal modal-#{item.alias}",
        div className: "subnav",

          item.subnav?.map (link) =>
            div className: 'subnav-item', onClick: @navigate.bind(link, link.alias),
              link.title



    div className: 'index',
      div className: 'logotype',
        div className: 'logotype-img',
          img src: '/images/modulift-logo.png'
        div className: 'logotype-link',
          'Visit ',
          a href: "#", 'www.modulift.com'

      div className: 'index-menu',
        menu

      div className: 'modal-overlay', onClick: @closeModal,
        modals,
        div className: 'modal-close', onClick: @closeModal




module.exports = Index
