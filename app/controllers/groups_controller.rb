class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def new
    @group = Group.new
  end
  
  def index
    @user = current_user
    @new_book = Book.new
    @groups = Group.all
  end
  
  def show
    @user = current_user
    @new_book = Book.new
    @group = Group.find(params[:id])
    @group_user = GroupUser.new
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      @group_user = @group.group_users.new
      @group_user.user_id = current_user.id
      @group_user.save
      redirect_to groups_path
    else
      render 'new'
    end
  end
  
  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end
  
  def new_mail
    @group = Group.find(params[:group_id])
  end

  def send_mail
    @group = Group.find(params[:group_id])
    group_users = @group.users
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    ContactMailer.send_mail(@mail_title, @mail_content,group_users).deliver
  end
  
  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end
  
  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
  
end
