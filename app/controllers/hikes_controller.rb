class HikesController < ApplicationController
  before_action :authorize_hike_view, only: :edit
  def index
    @user = current_user
    @hikes = Hike.all

  end

  def show
    @user = current_user
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
    @hike = Hike.find params[:id]
  end

  def update
    @hike = Hike.find params[:id] 

    if @hike.update(hike_params)
      redirect_to hikes_path
    else
      redirect_to hike_path(@hike.id)
    end
  end

  def destroy
  end

  def authorize_hike_view
    @hike = Hike.find params[:id]
    if @hike.user_id != current_user.id
      redirect_to hikes_path
    end
  end

  def create_from_existing
    @user = current_user
    @existing_hike = Hike.find(params[:id])
    #create new object with attributes of existing record 
    @hike = @user.hikes.new(@existing_hike.attributes)
    @hike.save
   end

  private
  def hike_params
     return params.require(:hike).permit(:name, :address, :distance, :difficulty, :photo, :dog_friendly)
   end

end
