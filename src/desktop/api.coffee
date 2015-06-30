$      = global.jQuery
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
  packPdf: (appCode, data, callback) ->
    jsonData = JSON.stringify(data)
    $.ajax
      type: "GET"
      url: u.makeUrl "api/v1/pack-pdf/?data=#{jsonData}&appCode=#{appCode}"
      dataType: "json"
      success: (resp) ->
        alert resp.message
      error: (resp, status, thrown) ->
        u.log "error:", resp
        alert resp.responseJSON.error.message