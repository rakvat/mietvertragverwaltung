class TotalSquareMetersController < ApplicationController
  before_action :set_total_square_meter, only: [:show, :edit, :update, :destroy]

  # GET /total_square_meters
  def index
    @total_square_meters = TotalSquareMeter.all
  end

  # GET /total_square_meters/1
  def show
  end

  # GET /total_square_meters/new
  def new
    @total_square_meter = TotalSquareMeter.new
  end

  # GET /total_square_meters/1/edit
  def edit
  end

  # POST /total_square_meters
  def create
    @total_square_meter = TotalSquareMeter.new(total_square_meter_params)

    if @total_square_meter.save
      redirect_to @total_square_meter, notice: 'Total square meter was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /total_square_meters/1
  def update
    if @total_square_meter.update(total_square_meter_params)
      redirect_to @total_square_meter, notice: 'Total square meter was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /total_square_meters/1
  def destroy
    @total_square_meter.destroy
    redirect_to total_square_meters_url, notice: 'Total square meter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_total_square_meter
      @total_square_meter = TotalSquareMeter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def total_square_meter_params
      params.require(:total_square_meter).permit(:value, :start)
    end
end
