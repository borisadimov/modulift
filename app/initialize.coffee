{ready} = require 'lib/utils'


ready().then ->
  appStore = require('stores/app')
  appStore.actions.start()
