class NeededBasicRentsController < ApplicationController
  before_action :set_needed_basic_rent, only: [:show, :edit, :update, :destroy]

  # GET /needed_basic_rents
  def index
    @needed_basic_rents = NeededBasicRent.all
  end

  # GET /needed_basic_rents/1
  def show
  end

  # GET /needed_basic_rents/new
  def new
    @needed_basic_rent = NeededBasicRent.new
  end

  # GET /needed_basic_rents/1/edit
  def edit
  end

  # POST /needed_basic_rents
  def create
    @needed_basic_rent = NeededBasicRent.new(needed_basic_rent_params)

    if @needed_basic_rent.save
      redirect_to @needed_basic_rent, notice: 'Needed basic rent was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /needed_basic_rents/1
  def update
    if @needed_basic_rent.update(needed_basic_rent_params)
      redirect_to @needed_basic_rent, notice: 'Needed basic rent was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /needed_basic_rents/1
  def destroy
    @needed_basic_rent.destroy
    redirect_to needed_basic_rents_url, notice: 'Needed basic rent was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_needed_basic_rent
      @needed_basic_rent = NeededBasicRent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def needed_basic_rent_params
      params.require(:needed_basic_rent).permit(:value, :start)
    end
end
