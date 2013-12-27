class NeededHeatingChargesController < ApplicationController
  before_action :set_needed_heating_charge, only: [:show, :edit, :update, :destroy]

  # GET /needed_heating_charges
  def index
    @needed_heating_charges = NeededHeatingCharge.all
  end

  # GET /needed_heating_charges/1
  def show
  end

  # GET /needed_heating_charges/new
  def new
    @needed_heating_charge = NeededHeatingCharge.new
  end

  # GET /needed_heating_charges/1/edit
  def edit
  end

  # POST /needed_heating_charges
  def create
    @needed_heating_charge = NeededHeatingCharge.new(needed_heating_charge_params)

    if @needed_heating_charge.save
      redirect_to @needed_heating_charge, notice: 'Needed heating charge was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /needed_heating_charges/1
  def update
    if @needed_heating_charge.update(needed_heating_charge_params)
      redirect_to @needed_heating_charge, notice: 'Needed heating charge was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /needed_heating_charges/1
  def destroy
    @needed_heating_charge.destroy
    redirect_to needed_heating_charges_url, notice: 'Needed heating charge was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_needed_heating_charge
      @needed_heating_charge = NeededHeatingCharge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def needed_heating_charge_params
      params.require(:needed_heating_charge).permit(:value, :start)
    end
end
