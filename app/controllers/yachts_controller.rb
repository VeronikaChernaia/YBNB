class YachtsController < ApplicationController
  def index
    @yachts = Yacht.all
  end
end
