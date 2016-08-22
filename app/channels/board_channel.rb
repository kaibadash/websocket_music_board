# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class BoardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "board_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def show(data)
    Rails.logger.info("board_channel.rb show #{data.inspect}" )
    music = Music.find_by_id(data["music_id"])
    ActionCable.server.broadcast 'board_channel', music: music
  end
end
