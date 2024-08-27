class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
     if user_signed_in?
        redirect_to yachts_path
     else
      @yachts = Yacht.limit(6)
    end
  end



end
