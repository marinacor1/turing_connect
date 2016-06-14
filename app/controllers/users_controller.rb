class UsersController < ApplicationController
  before_action :logged_in_user
  def index
    users = User.all
    @users = users.where.not(name: nil)
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow "#{user.name}, #{user.current_employer}, #{user.cohort}"
      marker.picture({"url" => "https://maps.gstatic.com/mapfiles/ms2/micons/blue.png", "width" => 32, "height" => 32})
      marker.json({name: user.name})
    end
  end

  def show
    @user = User.find(params[:id])
    @id = current_user.id
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        binding.pry
        #TODO currently passes in a bunch of information, need to pass in just what has changed.
        @user.update_newsfeed(params)
        flash[:error] = "Success! Your account updated."
      else
        flash[:error] = "Your account could not be updated. Please check your input and try again."
      end
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:status, :cohort, :name, :current_employer, :street_address, :city, :state, :email)
  end
end
