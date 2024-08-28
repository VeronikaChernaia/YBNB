class YachtsController < ApplicationController
  before_action :authenticate_user!
  def index
    @yachts = Yacht.all

     # Conditions dynamiques pour les filtres avec OR logique
     or_conditions = []
     or_values = []

     if params[:brand].present?
       or_conditions << "brand = ?"
       or_values << params[:brand]
     end

     if params[:port].present?
       or_conditions << "port = ?"
       or_values << params[:port]
     end

     if or_conditions.any?
       @yachts = @yachts.where(or_conditions.join(' OR '), *or_values)
     end

     # Filtrer par date de check-in et check-out si elles sont présentes (AND logique)
     if params[:check_in_date].present? && params[:check_out_date].present?
       check_in_date = Date.parse(params[:check_in_date])
       check_out_date = Date.parse(params[:check_out_date])

       @yachts = @yachts.joins(:bookings)
                        .where.not('bookings.check_in_date <= ? AND bookings.check_out_date >= ?', check_out_date, check_in_date)
     end
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

  def update
    @yacht = Yacht.find(params[:id])
    @yacht.update(yacht_params)
    redirect_to yachts_path
  end

  private

  def yacht_params
    params.require(:yacht).permit(:title, :brand, :description, :port, :price_per_hour, photos: [])
  end
end
