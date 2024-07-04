class FlatsController < ApplicationController
  before_action :set_flat, only: %i[ show edit update destroy ]

  def index
    @flats = policy_scope(Flat)
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  def show
  end

  def new
    authorize Flat
    @flat = Flat.new
  end

  def edit
  end

  def create
    @flat = Flat.new(flat_params)

    respond_to do |format|
      if @flat.save
        redirect_to flat_url(@flat), notice: "Flat was successfully created."
      else
       render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @flat.update(flat_params)
        redirect_to flat_url(@flat), notice: "Flat was successfully updated." 
      else
        render :edit, status: :unprocessable_entity 
      end
    end
  end

  def destroy
    @flat.destroy

    respond_to do |format|
      redirect_to flats_url, notice: "Flat was successfully destroyed."
    end
  end

  private
    def set_flat
      @flat = Flat.find(params[:id])
    end

    def flat_params
      params.require(:flat).permit(:name, :address)
    end
end
