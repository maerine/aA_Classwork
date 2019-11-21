class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(get_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def update
    user = User.update(params[:id])
    # user.update
  end

  private
  def get_params
    params.require(:user).permit(:name, :email)
  end
end