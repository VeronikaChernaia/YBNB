class DashboardController < ApplicationController
  def show
    @yachts = current_user.yachts
    @bookings = current_user.bookings
    @incoming_bookings = Booking.joins(:yacht).where(yachts: { user_id: current_user.id })
  end
end
