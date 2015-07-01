$      = global.jQuery
u      = require './utils'

module.exports =
  fetchSheets: (appCode, isIndex, callback, errCallback) ->
    $.ajax
      type: "GET"
      url: u.makeUrl "api/v1/ext-sheets/?appCode=#{appCode}&isIndex=#{isIndex}"
      dataType: "json"
      success: (resp) ->
        if callback?
          callback resp
        else if resp?.message?
          alert resp.message
      error: (resp, status, thrown) ->
        u.log "error:", resp
        if errCallback?
          errCallback resp, status, thrown
        else if resp?.responseJSON?.error?.message?
          alert resp.responseJSON.error.message
  packPdf: (appCode, data, callback, errCallback) ->
    jsonData = JSON.stringify(data)
    $.ajax
      type: "GET"
      url: u.makeUrl "api/v1/pack-pdf/?data=#{jsonData}&appCode=#{appCode}"
      dataType: "json"
      success: (resp) ->
        if callback?
          callback resp
        else if resp?.message?
          alert resp.message
      error: (resp, status, thrown) ->
        u.log "error:", resp
        if errCallback?
          errCallback resp, status, thrown
        else if resp?.responseJSON?.error?.message?
          alert resp.responseJSON.error.message