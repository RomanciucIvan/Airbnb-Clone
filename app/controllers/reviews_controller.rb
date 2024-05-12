
class ReviewsController < ApplicationController 
  before_action :set_apartment, only: [:new, :create]
  before_action :set_review, only: [:destroy]

  def new
    @apartment = Apartment.find(params[:apartment_id])
    @review = @apartment.reviews.build
  end
  

  def show
    @review = Review.find(params[:id])
  end

  def create
    @apartment = Apartment.find(params[:apartment_id])
    @review = @apartment.reviews.build(review_params)
    # @review.user = current_user 
    authorize @review
    if @review.save
      redirect_to apartment_path(@apartment), notice: 'Review was successfully created.'
    else
      render 'apartments/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to @review.apartment, notice: 'Review was successfully deleted.'
  end
  
  private

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end
  
  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end
  

  def set_review
    @review = Review.find(params[:id])
  end
end



