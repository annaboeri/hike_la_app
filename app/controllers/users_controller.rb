class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @hikes = @user.hikes
    @hike = Hike.find params[:id]
    @clone_hike = @hike.clone
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    return params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
