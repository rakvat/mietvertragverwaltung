class RentableRoomsController < ApplicationController
  before_action :set_rentable_room, only: [:show, :edit, :update, :destroy]

  # GET /rentable_rooms
  def index
    @rentable_rooms = RentableRoom.all
  end

  # GET /rentable_rooms/1
  def show
  end

  # GET /rentable_rooms/new
  def new
    @rentable_room = RentableRoom.new
  end

  # GET /rentable_rooms/1/edit
  def edit
  end

  # POST /rentable_rooms
  def create
    @rentable_room = RentableRoom.new(rentable_room_params)

    if @rentable_room.save
      redirect_to @rentable_room, notice: 'Rentable room was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rentable_rooms/1
  def update
    if @rentable_room.update(rentable_room_params)
      redirect_to @rentable_room, notice: 'Rentable room was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rentable_rooms/1
  def destroy
    @rentable_room.destroy
    redirect_to rentable_rooms_url, notice: 'Rentable room was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rentable_room
      @rentable_room = RentableRoom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rentable_room_params
      params.require(:rentable_room).permit(:value, :start)
    end
end
