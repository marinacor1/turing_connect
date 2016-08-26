class UsersController < ApplicationController
  def index
    users = User.all
    @users = users.where.not(name: 'none')
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      if user.current_employer
        marker.picture({"url" => "https://maps.gstatic.com/mapfiles/ms2/micons/blue.png", "width" => 32, "height" => 32})
        marker.lat user.latitude
        marker.lng user.longitude
      end
      if current_user
        marker.infowindow "#{user.name}, #{user.current_employer}, #{user.cohort}"
      else
        marker.infowindow "#{user.current_employer}"
      end
      marker.json({employer: user.current_employer})
    end
  end

  def show
    logged_in_user
    @user = User.find(params[:id])
    @id = current_user.id
  end

  def edit
    logged_in_user
    @user = User.find(params[:id])
  end

end
