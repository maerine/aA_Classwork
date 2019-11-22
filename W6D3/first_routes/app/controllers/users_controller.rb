class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
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
      render json: user.errors.full_messages, status: 422
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      if user.update(user_params)
        redirect_to user_url(user)
      else
        render json: user.errors.full_messages, status: 422
      end 
    else 
      render json: ["Sorry! That user doesn't exist :("], status: 422
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      render json: user if user.destroy  
    else 
      render json: ["Sorry! That user doesn't exist :("], status: 422
    end
  end 

  private
  def user_params
    params.require(:user).permit(:username)
  end
end