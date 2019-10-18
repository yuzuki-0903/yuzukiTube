class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	chat = Chat.create!(message: data['message'],user_id: 1 ,video_id: params['room'])
    template = ApplicationController.renderer.render(partial: 'chats/chat', locals: {chat: chat})
    ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_message(message)
  end
end
