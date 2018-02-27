class ReviewsController < ApplicationController
  before_action :authorize_review_view, only: :edit 
  
  def new
    @user = current_user
    @hike = Hike.find params[:id]
    @review = @hike.reviews.new
  end

  def create
    @user = current_user
    @hike = Hike.find params[:id]
    @review = @hike.reviews.new review_params
    if @review.save
      redirect_to hikes_path
    else
      redirect_to new_review_path
    end
  end

  def edit
    @review = Review.find params[:id]
  end

  def update
    @review = Review.find params[:id] 
    if @review.update(review_params)
      redirect_to hikes_path
    else
      redirect_to hike_path(@hike.id)
    end
  end

  def destroy
    @review = Review.find params[:id] 
    @review.destroy
    redirect_to hikes_path 
  end

  def authorize_review_view
    @review = Review.find params[:id]
    if @review.user_id != current_user.id
      redirect_to hikes_path
    end
  end

  private
  def review_params
     return params.require(:review).permit(:body, :author, :rating)
   end

end


