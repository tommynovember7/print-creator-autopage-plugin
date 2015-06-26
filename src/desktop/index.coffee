require './browser-deps'
u      = require './utils'
css    = require './load-css'
config = require './config'
Single = require './form/single'
Batch  = require './form/batch'
$      = global.jQuery

do ->
  'use strict'

  css.load config.css

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
#  kintone.events.on 'app.record.index.show', (event) ->
#    $head = $ kintone.app.getHeaderMenuSpaceElement()
#    $head.append Batch.createDOM()
#
#    event
