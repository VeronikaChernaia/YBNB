class YachtsController < ApplicationController
  before_action :authenticate_user!
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
    @yacht = Yacht.new(yacht_params)
    @yacht.user = current_user
    if @yacht.save
      redirect_to @yacht, notice: 'Yacht was successfully created.'
    else
      render :new
    end
  end

  def edit
    @yacht = Yacht.find(params[:id])
  end

  private

  def yacht_params
    params.require(:yacht).permit(:title, :brand, :description, :port, :price_per_hour, :photo)
  end
end
