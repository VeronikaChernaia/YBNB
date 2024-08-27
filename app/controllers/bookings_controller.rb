class BookingsController < ApplicationController
  before_action :set_yacht, only: [:new, :create]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
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
    redirect_to dashboard_path(@yacht), notice: 'Your booking request has been submitted.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    if @booking.update(booking_params)
      redirect_to dashboard_path, notice: 'Booking status updated successfully.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find_by(yacht_id: params[:yacht_id], id: params[:id])
    if @booking.nil?
      redirect_to dashboard_path, alert: "Booking not found."
    end
  end

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])

  end

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, params[:yacht_id])
  end

end
