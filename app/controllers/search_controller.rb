class SearchController < ApplicationController
  def index
    address = params[:location]
    arrival = params[:arrival]
    departure = params[:departure]
    guests = params[:guests]
    # @apartments = Apartment.all

    @results = policy_scope(Apartment.where("address ILIKE ?", "%#{address}%"))

    render :index 
  end
end
