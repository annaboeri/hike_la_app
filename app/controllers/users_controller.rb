class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @hikes = @user.hikes
    @all_hikes = Hike.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      redirect_to new_session_path
    else
      flash[:warning] = "Check your email and password."
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
