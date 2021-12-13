class UsersController < ApplicationController
 def index
    @users = User.all
    @user = current_user
 end
 
  def show
    @users = User.all
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_index_path(@user.id)
  end
  
private
def user_params
  params.require(:user).permit(:name,:profile,:image)
end
end