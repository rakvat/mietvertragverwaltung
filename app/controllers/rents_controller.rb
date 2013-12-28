class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy, :contract]

  # GET /rents
  def index
    @rents = Rent.all
  end

  # GET /rents/1
  def show
  end

  # GET /rents_contract/1
  def contract
    @rents = Rent.all_current_at(@rent.start)
    set_calc_data(@rent.start)
    rent_total_square = @rent.square_meters + @common_space/@rents.length
    @rent.heating_charges = (rent_total_square.to_f/@total_square * @needed_heating).round(2)
    @rent.assessory_charges = (rent_total_square.to_f/@total_square * @needed_assessory).round(2)
    if params.include?(:format) && params[:format] == 'pdf'
      pdf = PdfRentContract.new([@rent], view_context)
      send_data pdf.render, filename: "RentContract_#{@rent.start.year}/#{@rent.rooms.first.house.first}/#{@rent.rooms.first.number}",
                            type: "application/pdf",
                            disposition: "inline"
    end
  end

  # GET /rents_eval
  def eval
    @date = Date.current
    if params.include?('eval')
      year = params['eval']['date(1i)'].to_i
      month = params['eval']['date(2i)'].to_i
      day = params['eval']['date(3i)'].to_i
      @date = Date.new(year, month, day)
    end
    @rents = Rent.all_current_at(@date)
    set_calc_data(@date)
  end

  # GET /rents/new
  def new
    @rent = Rent.new
  end

  # GET /rents/1/edit
  def edit
  end

  # POST /rents
  def create
    @rent = Rent.new(rent_params)

    if @rent.save
      redirect_to @rent, notice: 'Rent was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rents/1
  def update
    if @rent.update(rent_params)
      redirect_to @rent, notice: 'Rent was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rents/1
  def destroy
    @rent.destroy
    redirect_to rents_url, notice: 'Rent was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rent_params
      params.require(:rent).permit(:start, :basic_rent, :room_id, :tenant_id)
    end

    def set_calc_data(date)
      @total_square = TotalSquareMeter.current_at(date)
      @needed_basic = NeededBasicRent.current_at(date)
      @needed_heating = NeededHeatingCharge.current_at(date)
      @needed_assessory = NeededAssessoryCharge.current_at(date)
      @rented_square = @rents.collect { |r| r.square_meters }.inject { |a,b| a+b }
      @common_space = @total_square - @rented_square
    end
end
