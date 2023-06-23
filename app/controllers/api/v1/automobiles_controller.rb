class Api::V1::AutomobilesController < ApplicationController
  before_action :set_automobile, only: %i[show destroy]

  def index
    @automobiles = Automobile.all
    render json: @automobiles
  end

  def show
    render json: @automobile
  end

  def create
    @automobile = Automobile.new(automobile_params)
    if @automobile.save
      render json: @automobile, status: :created
    else
      render json: @automobile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @automobile.destroy
    head :no_content
  end

  private

  def set_automobile
    @automobile = Automobile.find(params[:id])
  end

  def automobile_params
    params.require(:automobile).permit(:model, :year, :rate, :location)
  end
end
