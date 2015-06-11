config   = require 'config'
humanize = require './humanize'

module.exports =
  ready: (cb) ->
    new Promise (res) ->
      document.addEventListener('DOMContentLoaded', res, false)

  '$': document.querySelector.bind(document)

    # query = document.querySelector.bind(document)
    # queryAll = document.querySelectorAll.bind(document)
    # fromId = document.getElementById.bind(document)
    # fromClass = document.getElementsByClassName.bind(document)
    # fromTag = document.getElementsByTagName.bind(document)