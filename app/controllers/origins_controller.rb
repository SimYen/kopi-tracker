class OriginsController < ApplicationController
before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @origins = Origin.all.order("location ASC")
  end

  def show
    @origin = Origin.find(params[:id])
  end

  def new
  end

  def edit
    @origin = Origin.find(params[:id])
  end

  def create
    @origin = Origin.new(origin_params)
    @origin.save
    redirect_to @origin
  end

  def update
    @origin = Origin.find(params[:id])
    @origin.update(origin_params)
    redirect_to @origin
  end

  def destroy
    @origin = Origin.find(params[:id])
    @origin.destroy
    redirect_to root_path
  end

private

  def origin_params
    params.require(:origin).permit(:location, :phone)
  end

end