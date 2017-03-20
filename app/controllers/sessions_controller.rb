class SessionsController < ApplicationController
  def create
    binding.pry
    user = User.find_by(github_id: (request.env["omniauth.auth"].extra.raw_info.id))
    binding.pry
    if !(user).nil? #user matches github table id
      if user.admin?
        User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
        redirect_to admin_dashboard_path
      elsif user.first_login == true && User.from_omniauth(request.env["omniauth.auth"]) #if first time to site
        session[:user_id] = user.id
        redirect_to user_path(user)
      else user.first_login == false && User.from_omniauth(request.env["omniauth.auth"]) #if been here before
        session[:user_id] = user.id
        redirect_to newsfeed_path
      end
    else
      render file: 'public/404', status: 404 #if doesn't match database
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
