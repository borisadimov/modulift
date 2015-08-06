request      = require 'lib/request'

utils        = require 'lib/utils'
config       = require 'config'
# patientStore = require 'stores/patient'

module.exports = store = Exim.createStore
  actions: [
    'findTargets'
    'fetchUser'
    'checkSession'
    'signin'
    'signout'
    'signup'
    'forgot'
    'changepass'
    'clearError'
  ]

  initial:
    loggedIn: false
    user: {}
    isImpersonating: false
    impersonationTarget: null
    error: false
    pinCorrect: false


  checkSession:
    will: ->
      Parse.User.current()
    on: (current) ->
      return current if !!current

      token = localStorage.getItem('token')
      new Promise (res,rej) =>
        if !!token
          Parse.User.become token
        else
          rej()

    did: (user) ->
      data =
        error: false
        loggedIn: true
        user: user

      @set data

    didNot: ->




  fetchUser:
    will: ->
      @reset 'error'
    on: ->
      Parse.User.current().fetch().then (fetchedUser) ->
        console.log fetchedUser.getUsername()
      , (error) ->
        console.log error
      Parse.User.current().fetch()
    did: (user) ->
      console.log user
      data =
        error: false
        loggedIn: true
        user: user
      @set data
    didNot: ->
      console.log 'nope'


  signin:
    while: (signingIn) ->
      @set {signingIn}
    will: ->
      @reset 'error'
    on: (args) ->
      new Promise (res, rej) ->
        Parse.User.logIn args.name, args.password,
          success: (user) ->
            res user
          error: (user, error) ->
            rej user, error


    did: (user) ->
      data =
        error: false
        user: user
        loggedIn: true
      @set data
      localStorage.setItem 'token', user.getSessionToken()

    didNot: (user) ->
      sweetAlert('Oops...', 'Wrong login or password', 'error')

  signout:
    on: ->
      Parse.User.logOut()
    did: (args) ->
      data =
        error: false
        user: {}
        loggedIn: false
      @set data
      localStorage.removeItem('token')
      setTimeout =>
        window.location.reload()
      , 500

  forgot:
    on: (email) ->
      new Promise (res, rej) ->
        Parse.User.requestPasswordReset email,
          success: () ->
            res()
          error: (error) ->
            swal('Error', error.message, 'error')
            rej error.message

  changepass:
    on: (args) ->
      new Promise (res, rej) =>
        Parse.User.current().fetch()
        .then (fetchedUser) =>
          console.log 'oldpass'
          console.log args.oldpass
          name = fetchedUser.getUsername()

          Parse.User.logIn name, args.oldpass,

          success: (user) ->
            console.log('user, newpass')
            console.log(user, args.newpass)

            user.setPassword args.newpass
            user.save().then (user) ->
              console.log 'user'
              console.log user
              user.fetch().then (user) ->
                sweetAlert('Password changed', '','success')
                res()
              , (error) ->
                sweetAlert('Something went wrong', error, 'error')
                rej()

            error: (user, error) ->
             sweetAlert(user,error,"error")
             rej()



        , (error) ->
          sweetAlert "","Unauthorized", "error"
          rej()

    did: ->
      Parse.User.logOut()
      data =
        error: false
        user: {}
        loggedIn: false
      @set data
      localStorage.removeItem('token')
      setTimeout =>
        window.location.reload()
      , 500



  updateAccount:
    on: (newAccount) ->
      # TODO: perform an actual request
      new Promise (resolve) ->
        newAccount.current_password = null
        newAccount.new_password = null

        Object.keys(newAccount.consents).forEach (cons) ->
          newAccount.consents[cons] = new Date if newAccount.consents[cons]

        resolve newAccount
    did: (newAccount) ->
      @set 'account', newAccount


  clearPin: ->
    @reset 'pinCorrect'

  clearError: ->
    @reset 'error'
