config = require 'config'
{api} = config

serialize = (data) ->
  result = []
  for key, value of data
    result.push "#{encodeURIComponent(key)}=#{encodeURIComponent(value)}"
  result.join('&')

request =
  get: (url, data) ->
    url += '.json' if api.type is 'local'
    st = if url.indexOf('?') >= 0 then '&' else '?'
    url += "#{st}#{serialize(data)}" if data
    @send(url)

  post: (url, args) ->
    # formData = new FormData(args)
    # formData.append key, value for key, value of data
    params =
      method: 'post'
      headers:
        'Accept': 'application/json'
        'Content-Type': 'application/json'
      body: JSON.stringify args

    @send url, params

  put: (url, data) ->
    params =
      method: 'put'
      headers:
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      body: JSON.stringify(data)

    @send url, params

  del: (url) ->
    params =
      method: 'delete'
    @send url, params

  form: (url, form, method) ->
    params =
      method: method or 'post'
      body: form

    @send url, params

  send: (url, params = {}) ->
    url = "#{api.root}#{url}"

    status = (response) ->
      if (response.status >= 200 && response.status < 300)
        if response.status is 204
          {}
        else
          response.json()
      else
        throw response

    params.headers ?= {}
    params.credentials = 'include'

    promise = fetch(url, params).then(status)
    # promise = promise.then(tokenize)
    promise

  serialize: serialize

module.exports = request

