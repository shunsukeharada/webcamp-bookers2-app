class MessagesController < ApplicationController
    
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.save
    redirect_to request.referer
  end
  
  def message_params
    params.require(:message).permit(:room_id, :content)
  end
  
end
