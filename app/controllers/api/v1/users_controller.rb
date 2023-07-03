class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(name: params[:id])
    if @user
      render json: @user, status: :ok
    else
      render json: { error: 'User not found.' }, status: :not_found
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
