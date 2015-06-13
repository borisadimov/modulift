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
        alias: 'docs'
      ,
        title: 'User Instructions USA'
        alias: 'docs'
      ,
        title: 'Load Charts'
        alias: 'docs'
      ,
        title: 'Distributor Packs'
        alias: 'docs'
    ]
  ,
    alias: 'presentation'
    title: 'Presentation Material'
    subnav: [
      title: 'Presentations'
      alias: 'docs'
    ]
  ,
    alias: 'literature'
    title: 'Marketing Literature'
    subnav: [
        title: 'Brochures'
        alias: 'docs'
      ,
        title: 'Catalogues'
        alias: 'docs'
      ,
        title: 'Distributor Packs'
        alias: 'docs'
      ,
        title: 'Leaflets'
        alias: 'docs'
    ]
  ,
    alias: 'press'
    title: 'In The Press'
    subnav: [
        title: 'Press Releases'
        alias: 'docs'
      ,
        title: 'Case Studies'
        alias: 'docs'
      ,
        title: 'News'
        alias: 'docs'
      ,
        title: 'Exhibitition Schedule'
        alias: 'docs'
    ]
  ,
    alias: 'photo'
    title: 'Photo & Video'
    subnav: [
        title: 'Photos'
        alias: 'docs'
      ,
        title: 'Videos'
        alias: 'docs'
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
        alias: 'docs'
      ,
        title: 'Modulift Team'
        alias: 'team'
      ,
        title: 'Our Network'
        alias: 'network'
      ,
        title: 'Your Account'
        alias: 'docs'
    ]
]


config.team = [

    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,

    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
  ,
    avatar: '/images/team-avatar.jpg'
    name: 'Sarah Spivey'
    position: 'Managing Director'
    mail: 'sarah@modulift.com'
]

config.network = [

    x: 0.63
    y: 0.47
  ,
    x: 0.55
    y: 0.35


]





moment.locale 'en',
  week :
    dow : 1

