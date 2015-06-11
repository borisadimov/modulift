{div, h1, h2, a, button, img} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router
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
      $('.modal-overlay').style.display = "flex"
      $('.modal-overlay').style.pointerEvents = "auto"

      $('.modal-overlay').style.opacity = 1
      $(".modal-overlay .modal-#{name}").style.display = "flex"



  closeModal: ->
    if $('.modal-overlay')
      $('.modal-overlay').style.pointerEvents = "none"
      $('.modal-overlay').style.opacity = 0
      $$(".modal-overlay .index-modal")
      for modal in $$(".modal-overlay .index-modal")
        modal.style.display = "none"

  mailto: ->
    document.location.href = 'mailto:xyz@something.com'

  team: ->
    @transitionTo 'team'

  navigate: (alias) ->
    switch alias
      when 'message' then document.location.href = 'mailto:xyz@something.com'
      else @transitionTo alias

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

      div className: 'modal-overlay',
        modals,
        div className: 'modal-close', onClick: @closeModal




module.exports = Index
