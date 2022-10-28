class MessagesController < ApplicationController
    
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    unless @message.save
      flash[:notice] = "140文字以内で送信してください。"
    end
    redirect_to request.referer
  end
  
  def message_params
    params.require(:message).permit(:room_id, :content)
  end
  
end
