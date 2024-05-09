class ApartmentsController < ApplicationController

  before_action :set_apartment, only: %i[ show edit update destroy ]
  after_action :verify_policy_scoped, only: :index

  def index
    @apartments = Apartment.all
    @apartments = policy_scope(Apartment).all
    # authorize @apartments
  end

  def show
    @apartment = Apartment.find(params[:id])
    authorize @apartment
  end
  
  def new
    @apartment = Apartment.new
    @apartments = Apartment.all
    authorize @apartment
  end
  

  def edit
    @apartment = Apartment.find(params[:id])
    authorize @apartment
    
  end
  

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user

    authorize @apartment

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to apartment_url(@apartment), notice: "Apartment was successfully created." }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @apartment
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to apartment_url(@apartment), notice: "Apartment was successfully updated." }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @apartment
    @apartment.destroy

    respond_to do |format|
      format.html { redirect_to apartments_url, notice: "Apartment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    def apartment_params
      params.require(:apartment).permit(:title, :address, :description, :price, photos: [])
    end
end

