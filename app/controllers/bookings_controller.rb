class BookingsController < ApplicationController
  def new
    @yacht = Yacht.find(params[:yacht_id])
    @booking = Booking.new
  end

   # before_action :set_restaurant, only: %i[new create]

  def create
    @booking = Booking.new(booking_params)
    @booking.yacht = @yacht
    @booking.save
    redirect_to yacht_path(@yacht)
  end

  private

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, params[:yacht_id])
  end

end
