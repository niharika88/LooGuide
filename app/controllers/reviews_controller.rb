class ReviewsController < ApplicationController

  def index
  end

  def edit
  end

  def destroy
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]
    if @review.save
      redirect_to "/restrooms/#{@review.restroom_id}"
    else
      # flash[:notice] = "and nobody is that interested in your business..."
      render :new
    end
  end

  def update
    @review = Review.update(review_params)
  end

  private 

  def review_params
    params.require(:review).permit(:comment, :rating, :restroom_id)
  end


end