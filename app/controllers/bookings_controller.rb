class BookingsController < ApplicationController
  before_action :set_yacht, only: [:new, :create, :show]
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :update]

  def new
    @yacht = Yacht.find(params[:yacht_id])
    @booking = Booking.new
  end

  def show
    # @booking is already set by the before_action
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
    @booking2 = Booking.find(params[:id])
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to dashboard_path, notice: 'Booking status updated successfully.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, params[:yacht_id], :booking_status)
  end

end
