class DashboardController < ApplicationController
  def show
    @yachts = current_user.yachts 
    @bookings = current_user.bookings
  end
end
