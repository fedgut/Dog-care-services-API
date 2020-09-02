class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

  def create
    @user = User.create!(params[:user_params])
    json_response(@user, :created)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    head :no_content
  end

  private

  def user_params
    params.require(:name).permit(:admin)
  end
end
