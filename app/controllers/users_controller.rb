class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end

  def show
    redirect_to root_path unless logged_in?
    @user = User.find(params[:id])
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end