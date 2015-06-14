config   = require 'config'
humanize = require './humanize'

module.exports =
  ready: (cb) ->
    new Promise (res) ->
      document.addEventListener('DOMContentLoaded', res, false)

  '$': document.querySelector.bind(document)



  addClass: (o, c) ->
    re = new RegExp("(^|\\s)" + c + "(\\s|$)", "g")
    if re.test(o.className)
      return
    o.className = (o.className + " " + c).replace(/\s+/g, " ").replace(/(^ | $)/g, "")

  removeClass: (o, c) ->
    re = new RegExp("(^|\\s)" + c + "(\\s|$)", "g")
    o.className = o.className.replace(re, "$1").replace(/\s+/g, " ").replace(/(^ | $)/g, "")

  toggle: (el) ->
    el.style.display = (el.style.display == 'none') ? '' : 'none'



    # query = document.querySelector.bind(document)
    # queryAll = document.querySelectorAll.bind(document)
    # fromId = document.getElementById.bind(document)
    # fromClass = document.getElementsByClassName.bind(document)
    # fromTag = document.getElementsByTagName.bind(document)