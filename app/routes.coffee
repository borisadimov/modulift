{Route, DefaultRoute, Redirect} = Exim.Router
defaultRouteName = 'index'


mount = (name) ->
  unless name.indexOf('/') >= 0
    name = name + '/' + name.charAt(0).toUpperCase() + name.slice(1)
  require("components/#{name}")().type

module.exports =
  Route name: 'app', handler: mount('app/App'), path: '/',
    Route name: 'signin', handler: mount('auth/Signin')
    Route name: 'forgot', handler: mount('auth/Signin')


    Route name: 'index',    handler: mount('index')
    Route name: 'documents', handler: mount('documents/Docs'), path: '/documents/:alias'
    Route name: 'gallery', handler: mount('documents/Gallery'), path: '/gallery'
    Route name: 'video', handler: mount('documents/Video'), path: '/video'
    Route name: 'team',     handler: mount('network/Team'), path: '/team'
    Route name: 'network',     handler: mount('network/Network'), path: '/network'
    Route name: 'profile',     handler: mount('network/Profile'), path: '/profile'

    Redirect from:'/', to: defaultRouteName
    # Route name: 'signup',    handler: mount('auth/Signup')
    # Route name: 'signin',    handler: mount('auth/Flipped')
    # Route name: 'forgot',    handler: mount('auth/Flipped')


