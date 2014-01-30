class CommonSpacesController < ApplicationController
  before_action :set_common_space, only: [:show, :edit, :update, :destroy]

  # GET /common_spaces
  def index
    @common_spaces = CommonSpace.all
  end

  # GET /common_spaces/1
  def show
  end

  # GET /common_spaces/new
  def new
    @common_space = CommonSpace.new
  end

  # GET /common_spaces/1/edit
  def edit
  end

  # POST /common_spaces
  def create
    @common_space = CommonSpace.new(common_space_params)

    if @common_space.save
      redirect_to @common_space, notice: 'Common space was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /common_spaces/1
  def update
    if @common_space.update(common_space_params)
      redirect_to @common_space, notice: 'Common space was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /common_spaces/1
  def destroy
    @common_space.destroy
    redirect_to common_spaces_url, notice: 'Common space was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_space
      @common_space = CommonSpace.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def common_space_params
      params.require(:common_space).permit(:value, :start)
    end
end
