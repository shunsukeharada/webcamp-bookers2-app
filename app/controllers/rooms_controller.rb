class RoomsController < ApplicationController
 
 def show
   @room = Room.find(params[:id])
   room_entries = @room.entries
   message_entry = room_entries.where.not(user_id: current_user).first
   @message_user = User.find(message_entry.user_id)
   @messages = @room.messages.all
   @message = Message.new
 end
 
 def create
   @room = Room.create
   @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
   @entry2 = Entry.create(room_id: @room.id, user_id: params[:entry][:user_id])
   #@entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
   redirect_to room_path(@room.id)
 end
 
end
