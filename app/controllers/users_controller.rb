class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:error] = "Success! Your account updated."
      else
        flash[:error] = "Your account could not be updated. Please check your input and try again."
      end
        redirect_to dashboard_path
  end
end
