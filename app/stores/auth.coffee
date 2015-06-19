request      = require 'lib/request'

utils        = require 'lib/utils'
config       = require 'config'
# patientStore = require 'stores/patient'

postAvatar = (file) ->
  form = new FormData
  form.append 'file', file
  request.form('user/avatar', form)

module.exports = store = Exim.createStore
  actions: [
    'findTargets'
    'fetchUser'
    'uploadAvatar'
    'signin'
    'signout'
    'signup'
    'forgot'
    'lookup'
    'startImpersonation'
    'finishImpersonation'
    'updateProfile'
    'updateAccount'
    'checkPin'
    'clearPin'
    'clearError'
  ]

  initial:
    loggedIn: false
    user: {}
    isImpersonating: false
    impersonationTarget: null
    error: false
    pinCorrect: false

  fetchUser:
    will: ->
      @reset 'error'
    on: ->
      request.get('user')
    did: (user) ->
      data =
        error: false
        loggedIn: true
        user: user
      if user.proxying
        data.isImpersonating = true
        data.impersonationTarget = user
      @set data
    didNot: ->


  signin:
    while: (signingIn) ->
      @set {signingIn}
    will: ->
      @reset 'error'
    on: (args) ->
      # request.post 'session', args
      console.log args
      new Promise (res, rej) ->
        Parse.User.logIn args.name, args.password,
          success: (user) ->
            res user
          error: (user, error) ->
            rej user, error


    did: (response) ->
      @set
        error: false
        user: response
        loggedIn: true
    didNot: (resp) ->
      resp.json().then (err) => @set error: err.error

  signout:
    on: ->
      req = request.del('session')
    did: (args) ->
      @set
        error: false
        user: {}
        loggedIn: false
      localStorage.removeItem('token')
      setTimeout =>
        window.location.reload()
      , 500

  forgot:
    on: (email) ->
      request.post('user/forgot', {email})

  lookup:
    while: (lookingUp) ->
      @set {lookingUp}
    on: (args) ->
      @creds = args
      request.post("user/lookup", {email: args.email})
    did: ->
      @set error: false, email: @creds.email, password: @creds.password
    didNot: (resp) ->
      resp.json().then (err) => @set error: err.error

  signup:
    on: (credentials) ->
      console.log credentials
      request.post('user', credentials)
    did: (data) ->
      @reset 'error'
    didNot: (resp) ->
      resp.json().then (err) => @set error: err.error

  uploadAvatar:
    while: (avatarUploading) ->
      @set {avatarUploading}
    on: (args) ->
      postAvatar(args.file)
    did: (data) ->
      user = @get('user')
      user.avatar_url = data.avatar_url
      @set {user}
    didNot: (resp) ->
      resp.json().then (err) =>
        console.error err

  startImpersonation:
    on: (user_id) ->
      request.post('impersonation', id: user_id)
    did: (patient) ->
      @set
        isImpersonating: true
        impersonationTarget: patient
        user: patient
      patientStore.actions.fetch()

  finishImpersonation:
    on: ->
      request.del('impersonation')
    did: (user) ->
      @set
        isImpersonating: false
        impersonationTarget: null
        user: user
      patientStore.actions.fetch()

  findTargets:
    on: (query, cb) ->
      @cb = cb
      request.get("patients?q=#{query}")
    did: (targets) ->
      @cb(targets)

  # willFindTargets: (q, cb) ->
  #   qe = new RegExp q, 'i'
  #   req = request.get("patients?q=#{q}")
  #   {req, cb}

  # onFindTargets: (args) ->
  #   {req, cb} = args
  #   req.then (data) ->
  #     cb(data)

  setAvatar: (avatar) ->
    @set {avatar}

  updateProfile:
    on: (newProfile) ->
      p = config.defaultProfile

      Promise.resolve
        dob: p.dob
        employee_id: p.employee_id
        xoid: p.xoid

    did: (newProfile) ->
      @set 'profile', newProfile

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

  checkPin:
    while: (checkingPin) ->
      @set {checkingPin}
    will: ->
      @reset 'error'
      @reset 'pinCorrect'
    on: (pin) ->
      request.post 'checkin/pin', {pin}
    did: (response) ->
      @set
        error: false
        pinCorrect: true
    didNot: (resp) ->
      @set error: 'pin'

  clearPin: ->
    @reset 'pinCorrect'

  clearError: ->
    @reset 'error'
