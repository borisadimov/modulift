utils = require 'lib/utils'

module.exports = config = {api: {}}

config.production = false

# config.pin = '1111'

# config.client = 'apple'
# config.platform = 'dekstop'

config.hostname = if config.production
  'https://apple-wellnesscenter.com/'
else
  'http://candyshop.local/'

config.api.root = "#{config.hostname}v1/"


config.nav = [
    alias: 'tech'
    title: 'Techical Information'
    subnav: [
        title: 'User Instructions UK'
        alias: 'test'
      ,
        title: 'User Instructions USA'
        alias: 'test'
      ,
        title: 'Load Charts'
        alias: 'test'
      ,
        title: 'Distributor Packs'
        alias: 'test'
    ]
  ,
    alias: 'presentation'
    title: 'Presentation Material'
    subnav: [
      title: 'Presentations'
      alias: 'test'
    ]
  ,
    alias: 'literature'
    title: 'Marketing Literature'
    subnav: [
        title: 'Brochures'
        alias: 'test'
      ,
        title: 'Catalogues'
        alias: 'test'
      ,
        title: 'Distributor Packs'
        alias: 'test'
      ,
        title: 'Leaflets'
        alias: 'test'
    ]
  ,
    alias: 'press'
    title: 'In The Press'
    subnav: [
        title: 'Press Releases'
        alias: 'test'
      ,
        title: 'Case Studies'
        alias: 'test'
      ,
        title: 'News'
        alias: 'test'
      ,
        title: 'Exhibitition Schedule'
        alias: 'test'
    ]
  ,
    alias: 'photo'
    title: 'Photo & Video'
    subnav: [
        title: 'Photos'
        alias: 'test'
      ,
        title: 'Videos'
        alias: 'test'
    ]
  ,
    alias: 'message'
    title: 'Send Message'
  ,
    alias: 'team'
    title: 'Modulift Team'

  ,
    alias: 'contacts'
    title: 'Contacts'
    subnav: [
        title: 'Send Message'
        alias: 'test'
      ,
        title: 'Modulift Team'
        alias: 'test'
      ,
        title: 'Our Network'
        alias: 'test'
      ,
        title: 'Your Account'
        alias: 'test'
    ]
]




moment.locale 'en',
  week :
    dow : 1

