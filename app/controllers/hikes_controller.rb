class HikesController < ApplicationController
  def index
    @hikes = Hike.all
  end

  def show
    @hike = Hike.find params[:id]
  end

  def new
    @user = current_user
    @hike = @user.hikes.new
  end

  def create
    @user = current_user
    @hike = @user.hikes.new hike_params
    if @hike.save
      redirect_to hikes_path
    else
      redirect_to new_hike_path
    end
  end

  def edit
    @hike = Hike.find(params[:id])
  end

  def update
    @hike = Hike.find params[:id] 
    @hike = @user.hikes.new hike_params 
    if @hike.save
      redirect_to hikes_path
    else
      redirect_to hike_path(@hike.id)
    end
  end

  def destroy
  end

  def authorize_hike_edit
    @hike = Hike.find params[:id]
    if @hike.user_id != current_user.id
      redirect_to hikes_path
    end
  end

  private
  def hike_params
     return params.require(:hike).permit(:name, :address, :distance, :difficulty, :photo, :dog_friendly)
   end

end
