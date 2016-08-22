App.board = App.cable.subscriptions.create "BoardChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log "received " + data
    # TODO:jqueryでDOMいじくりまわしが許されるのは小学生まで
    $("#title").html(data.music.title)
    $("#artist").html(data.music.artist)
    $("#description").html(data.music.description)

  show: (data) ->
    @perform 'show', music_id: data

# TODO:
$(document).on 'keypress', '[data-behavior~=show_music]', (event) ->
  if event.keyCode is 13 # return = send
    App.board.show event.target.value
    event.target.value = ''
    event.preventDefault()
