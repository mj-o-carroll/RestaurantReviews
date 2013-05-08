class ReviewsController < ApplicationController
   before_filter :signed_in_user, only: [:create, :destroy]
   before_filter :correct_user, only: :destroy
 

	 def show
    @review = Review.find(params[:id])
   end

  def new
    @review = Review.new
  end

  def index
  @reviews = Review.all
  end

  def create
    @review = current_user.reviews.build(params[:review])
    if @review.save
    	flash[:success] = "Thank you for your comments!"
      redirect_to @review
    else
      render 'new'
    end
  end
  
    def destroy
    @review.destroy
    redirect_to root_url
  end

private

    def correct_user
      @review = current_user.reviews.find_by_id(params[:id])
      redirect_to root_url if @review.nil?
    end
end
