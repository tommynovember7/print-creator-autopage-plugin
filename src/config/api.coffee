$      = require 'jquery'
config = require './config'
u      = require './utils'

module.exports =
  fetchSheets: (appCode, isIndex, callback) ->
    $.ajax
      type: "GET"
      url: u.makeUrl "api/v1/ext-sheets/?appCode=#{appCode}&isIndex=#{isIndex}"
      dataType: "json"
      success: (resp) ->
        callback resp
      error: (resp, status, thrown) ->
        u.log "error:", resp