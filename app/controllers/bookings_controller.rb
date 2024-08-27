class BookingsController < ApplicationController
  before_action :set_yacht, only: [:new, :create]
  before_action :authenticate_user!
  def new
    @yacht = Yacht.find(params[:yacht_id])
    @booking = Booking.new
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.yacht = @yacht
    @booking.user = current_user
    @booking.save
    if @booking.save!
    redirect_to yachts_path(@yacht)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])

  end

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, params[:yacht_id])
  end

end
