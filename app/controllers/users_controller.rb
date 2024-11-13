class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_logged_out, except: [:show, :edit, :update]
  before_action :require_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  def show
    @user = current_user
  end
  def edit
    @user = current_user
  end
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end
    
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
