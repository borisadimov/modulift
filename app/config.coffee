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
        alias: 'documents/user-instructions-uk'
      ,
        title: 'User Instructions USA'
        alias: 'documents/user-instructions-usa'
      ,
        title: 'Load Charts'
        alias: 'documents/load-charts'
      ,
        title: 'Distributor Packs'
        alias: 'documents/distributor-packs-uk'
    ]
  ,
    alias: 'presentation'
    title: 'Presentation Material'
    subnav: [
      title: 'Presentations'
      alias: 'documents/presentation'
    ]
  ,
    alias: 'literature'
    title: 'Marketing Literature'
    subnav: [
        title: 'Brochures'
        alias: 'documents/brochure'
      ,
        title: 'Catalogues'
        alias: 'documents/catalogues'
      ,
        title: 'Distributor Packs'
        alias: 'documents/distributor-packs-uk'
      ,
        title: 'Leaflets'
        alias: 'documents/leaflets'
    ]
  ,
    alias: 'press'
    title: 'In The Press'
    subnav: [
        title: 'Press Releases'
        alias: 'documents/press-releases'
      ,
        title: 'Case Studies'
        alias: 'documents/case-study'
      ,
        title: 'News'
        alias: 'documents/news'
      ,
        title: 'Exhibitition Schedule'
        alias: 'documents/expo-schedule'
    ]
  ,
    alias: 'photo'
    title: 'Photo & Video'
    subnav: [
        title: 'Photos'
        alias: 'documents/'
      ,
        title: 'Videos'
        alias: 'documents/'
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
        alias: 'documents/'
      ,
        title: 'Modulift Team'
        alias: 'team'
      ,
        title: 'Our Network'
        alias: 'network'
      ,
        title: 'Your Account'
        alias: 'documents/'
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

