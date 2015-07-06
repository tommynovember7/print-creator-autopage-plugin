require '../browser-deps'
config = require '../config'
Single = require './form/single'
Batch  = require './form/batch'
api    = require '../components/print-creator/api'
$      = global.jQuery
u      = require '../utils'

do ->
  'use strict'

  params = kintone.plugin.app.getConfig(config.pluginId)
  config.appCode = params.appCode
  config.showSheets = JSON.parse params.showSheets
  config.autoSheets = JSON.parse params.autoSheets

  # Single PDF
  kintone.events.on 'app.record.detail.show', (event) ->
    $head = $ kintone.app.record.getHeaderMenuSpaceElement()
    $head.append Single.createDOM()

    event

  # Batch PDF @todo
  kintone.events.on 'app.record.index.show', (event) ->

    api.fetchSheets(config.appCode, 1, (sheets) ->
      $head = $ kintone.app.getHeaderMenuSpaceElement()
      $head.append Batch.createDOM()
    , (resp, status, thrown) ->
      if resp?.responseJSON?.error?.message?
        u.log resp.responseJSON.error.message
    )

    event
