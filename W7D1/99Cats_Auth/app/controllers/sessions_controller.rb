class SessionsController < ApplicationController
  def new
    @user = User.new
    if @user.save
      render @user
      # render :new
    else
      render @user.errors.full_messages
    end
  end

  def create
    # @user = User.new(user_params)
    # if @user.save
    #   redirect_to user_url(@user)
    # else
    #   flash.now[:errors] = @user.errors.full_messages
    #   render :new
    # end
    User.find_by_credentials(user_name, password)
    @user.reset_session_token!
    
    redirect_to @cats/index
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end