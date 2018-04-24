class ReviewsController < ApplicationController
  before_action :authorize_review_view, only: :edit 
  
  def new
    @hike = Hike.find params[:id]
    @review = @hike.reviews.new
  end

  def create
    @hike = Hike.find params[:id]
    hike_id = @hike.original_hike_id || @hike.id 
    @review = Review.new(review_params)
    @review.hike_id = hike_id
    @review.user_id = current_user.id
    if @review.save
      redirect_to hike_path
    else
      redirect_to reviews_path
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
      redirect_to edit_review_path(@review.id)
    end
  end

  def destroy
    @review = Review.find params[:id] 
    @review.destroy
    redirect_to hikes_path
  end

  # only display reviews if user is logged in:
  # def authorize_review_view
  #   @review = Review.find params[:id]
  #   if @review.user_id != current_user.id
  #     redirect_to hikes_path
  #   end
  # end

  private
  def review_params
     return params.require(:review).permit(:body, :author, :hike_rating)
   end

end


