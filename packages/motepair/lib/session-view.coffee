{View} = require 'atom-space-pen-views'

module.exports =

class SessionView extends View
  initialize: ->
    @on 'click', =>
      atom.clipboard.write(@session)

  @content: ->
    @div class: 'motepair session-id inline-block', outlet: 'sessionId',  =>
      @span 'Session ID: '
      @span class: 'id', outlet: 'id'

  show: (session)->
    @session = session
    @id.text session
    statusBar = document.querySelector('status-bar')
    statusBar.addLeftTile({item: this})

  hide: ->
    @detach()
