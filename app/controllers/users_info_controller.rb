class UsersInfoController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(resources_params)
      flash[:notice] = 'Profile update success. Please re-login'
      redirect_to new_user_session_path 
    else
      flash[:notice] = 'Password & Password confirmation must match!'
      render 'edit'
    end
  end

  private

  def resources_params
    params.require(:user).permit(:email, :name, :level, :password, :password_confirmation)
  end

end
