appStore = require 'stores/app'
store    = require 'stores/auth'

config = require 'config'

{div, h2, a, p, form, input, img, icn, button, spinner} = Exim.DOM
{cx} = Exim.helpers
{Navigation, State, RouteHandler} = Exim.Router





Profile = Exim.createView
  mixins: [Navigation, State, store.connect('user')]

  getInitialState: ->
    oldpass: ''
    newpass: ''
    confirmpass: ''


  signOut: ->
    store.actions.signout()

  resetPassword: ->
    oldpass = @state.oldpass
    newpass = @state.newpass
    # store.actions.clearError()
    store.actions.changepass({oldpass, newpass})

  goback: ->
    @transitionTo 'index'


  openModal: ->
   $('.modal-overlay').addClass 'showed'

  closeModal: ->
      $('.modal-overlay').removeClass 'showed'


  onChange: (type) -> (evt) =>
    state = {}
    state[type] = evt.currentTarget.value
    @setState state


  render: ->

    div className: 'network',
      div className: 'network-header',
        div className: 'network-header-goback', onClick: @goback
        div className: 'network-header-title', onClick: @goback,
          'Your details'
      div className: 'profile',
        unless Object.keys(@state.user).length is 0
          div className: 'profile-info',
            div className: 'profile-info-item',
              div className: 'profile-info-item-key', 'Name'
              div className: 'profile-info-item-value', "#{@state.user.get('FirstName')} #{@state.user.get('LastName')}"
            div className: 'profile-info-item',
              div className: 'profile-info-item-key', 'Email'
              div className: 'profile-info-item-value', @state.user.get('email')
            div className: 'profile-info-item',
              div className: 'profile-info-item-key', 'ID'
              div className: 'profile-info-item-value', @state.user.getUsername()


        div className: 'profile-actions',
          div className: 'profile-actions-item signout', onClick: @signOut, "Sign Out"
          div className: 'profile-actions-item changepass', onClick: @openModal, "Change Password"





      div className: 'modal-overlay',
        div className: 'flipped-section changepass',
          div className: 'flipped-inner',
            div className: cx('flipped-container': true, flipped: true), ref: 'container',
              div className: 'flipped-card',
                div className: 'flipped-front',
                  form ref: 'form', onSubmit: @changepass,
                    div className: 'input-wrapper oldpass',
                      input name: 'oldpass', ref: 'oldpass', type: 'password', placeholder: 'Old Password', onChange: @onChange('oldpass')
                    div className: 'input-wrapper newpass',
                      input name: 'newpass', ref: 'newpass', type: 'password', placeholder: 'New Password', onChange: @onChange('newpass')
                    div className: 'input-wrapper confirmpass',
                      input name: 'confirmpass', ref: 'confirmpass', type: 'password', placeholder: 'Confirm Password', onChange: @onChange('confirmpass')

                    input type: 'submit'
                    div className: "submit visible #{cx disabled: !(@state.oldpass and ((@state.newpass is @state.confirmpass) and (@state.newpass != '')))} ", onClick: @resetPassword,
                      'OK'


        div className: 'modal-close', onClick: @closeModal







module.exports = Profile
