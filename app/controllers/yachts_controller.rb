class YachtsController < ApplicationController
  before_action :yacht_params, only: [:new, :create]
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
    if @yacht.save
      redirect_to @yacht, notice: 'Yacht was successfully created.'
    else
      render :new
    end
  end

  private

  def yacht_params
    params.required(:yacht).permit(:title, :brand, :description, :port, :price_per_hour)
  end
end
