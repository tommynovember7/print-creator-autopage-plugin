request = require 'superagent'
u       = require './utils'

module.exports =
  fetchSheets: (appCode, isIndex, callback) ->
    request
    .get(u.makeUrl "api/v1/ext-sheets/?appCode=#{appCode}&isIndex=#{isIndex}")
    .end((err, res) ->
      if callback?
        callback err, res.body
    )
  checkAppCode: (data, callback) ->
    request
    .post(u.makeUrl "api/v1/public/test/check")
    .send(data)
    .end((err, res) ->
      if callback?
        callback err, res.body
    )
