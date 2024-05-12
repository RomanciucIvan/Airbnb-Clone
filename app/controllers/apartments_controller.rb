class ApartmentsController < ApplicationController

  before_action :set_apartment, only: %i[ show edit update destroy ]
  after_action :verify_policy_scoped, only: :index

  def index
    @apartments = policy_scope(Apartment)
    # authorize @apartment
  end

  def show
    authorize @apartment
  end
  
  def new
    @apartment = Apartment.new
    @apartments = Apartment.all
    authorize @apartment
  end
  

  def edit
    authorize @apartment
  end
  

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user
    authorize @apartment

    if @apartment.save
      redirect_to apartment_path(@apartment), notice: "Apartment was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    authorize @apartment

    if @apartment.update(apartment_params)
      redirect_to apartment_path(@apartment), notice: "Apartment was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    authorize @apartment

    @apartment.destroy
    redirect_to apartments_path, notice: "Apartment was successfully destroyed." 
  end

  private
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    def apartment_params
      params.require(:apartment).permit(:title, :address, :description, :price, photos: [])
    end
end

