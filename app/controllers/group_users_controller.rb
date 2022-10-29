class GroupUsersController < ApplicationController
  def create
    @group_user = current_user.group_users.new(group_user_params)
    @group_user.save
    redirect_to groups_path
  end
  
  def destroy
    @group_user = GroupUser.find_by(group_id: params[:group_user][:group_id], user_id: params[:id])
    @group_user.destroy
    redirect_to groups_path
  end
  
  def group_user_params
    params.require(:group_user).permit(:group_id)
  end
end
