class HikesController < ApplicationController
  before_action :authorize_hike_view, only: :edit
  def index
    @user = current_user
    @hikes = Hike.where(duplicate: nil)
    @reviews = Review.all

  end

  def show
    @user = current_user
    @hike = Hike.find params[:id]

    if @hike.original_hike_id
      @original_hike = Hike.find @hike.original_hike_id
      @reviews = @original_hike.reviews
    else
      @reviews = @hike.reviews
    end

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
    @hike = Hike.find params[:id] 
    @hike.destroy
    redirect_to user_path 
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
    @hike = @user.hikes.new do |h|
      h.name =  @existing_hike.name
      h.address =  @existing_hike.address
      h.distance =  @existing_hike.distance
      h.difficulty =  @existing_hike.difficulty
      h.photo = @existing_hike.photo 
      h.dog_friendly =  @existing_hike.dog_friendly
      h.original_hike_id = @existing_hike.id
    end
    @hike.save
    redirect_to user_path(current_user.id)
   end

  private
  def hike_params
     return params.require(:hike).permit(:name, :address, :distance, :difficulty, :photo, :dog_friendly)
   end

end
