class ApartmentsController < ApplicationController

  before_action :set_apartment, only: %i[ show edit update destroy ]

  def index
    @apartments = Apartment.all
  end

  def show
  end
  
  def new
    @apartment = Apartment.new
  end

  def edit
  end
  

  def create
    @apartment = Apartment.new(apartment_params)
    if @apartment.save
      redirect_to apartment_path(@apartment), notice: "Apartment was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @apartment.update(apartment_params)
      redirect_to apartment_path(@apartment), notice: "Apartment was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @apartment.destroy
      redirect_to apartments_path, notice: "Apartment was successfully destroyed." 
  end

  private
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    def apartment_params
      params.require(:apartment).permit(:title, :address, :description, :price)
    end
end

