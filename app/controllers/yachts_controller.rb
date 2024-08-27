class YachtsController < ApplicationController
  def index
    @yachts = Yacht.all
  end

  def show
    @yacht = Yacht.find(params[:id])
  end

  def new
    @yacht = Yacht.new
  end

  def create
    yacht = Yacht.new(yacht_params)
    yacht.save
    redirect_to yacht_path
  end

private
  def yacht_params
    params.require(:yacht).permit(:title, :brand, :price_per_hour, :description, :port, :integer)
  end

end
