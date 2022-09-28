class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(required_params)

    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def required_params
    params.require(:user).permit(:email, :phone_number, :avatar, :name, :surname)
  end
end
