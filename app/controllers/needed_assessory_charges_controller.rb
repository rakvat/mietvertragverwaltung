class NeededAssessoryChargesController < ApplicationController
  before_action :set_needed_assessory_charge, only: [:show, :edit, :update, :destroy]

  # GET /needed_assessory_charges
  def index
    @needed_assessory_charges = NeededAssessoryCharge.all
  end

  # GET /needed_assessory_charges/1
  def show
  end

  # GET /needed_assessory_charges/new
  def new
    @needed_assessory_charge = NeededAssessoryCharge.new
  end

  # GET /needed_assessory_charges/1/edit
  def edit
  end

  # POST /needed_assessory_charges
  def create
    @needed_assessory_charge = NeededAssessoryCharge.new(needed_assessory_charge_params)

    if @needed_assessory_charge.save
      redirect_to @needed_assessory_charge, notice: 'Needed assessory charge was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /needed_assessory_charges/1
  def update
    if @needed_assessory_charge.update(needed_assessory_charge_params)
      redirect_to @needed_assessory_charge, notice: 'Needed assessory charge was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /needed_assessory_charges/1
  def destroy
    @needed_assessory_charge.destroy
    redirect_to needed_assessory_charges_url, notice: 'Needed assessory charge was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_needed_assessory_charge
      @needed_assessory_charge = NeededAssessoryCharge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def needed_assessory_charge_params
      params.require(:needed_assessory_charge).permit(:value, :start)
    end
end
