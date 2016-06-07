class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])  && User.find_by(gihub_id: (request.env["omniauth.auth"][:uid]))
      session[:user_id] = user.id
    else
      render file: 'public/404', status: 404
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
