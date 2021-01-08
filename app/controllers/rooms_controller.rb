class RoomsController < ApplicationController
  protect_from_forgery
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_messages_path(@room.id)
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end
  def index
    @room = Room.all
    @room_user = RoomUser.new(params[:id])
  end

  private

  def room_params
    params.require(:room).permit(:rooms_name, user_ids: [])
  end
end
