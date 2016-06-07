class SessionsController < ApplicationController
  def create
    if User.find_by(github_id: (request.env["omniauth.auth"].extra.raw_info.uid)) == !nil
      if user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
        redirect_to root_path
      end
    else
      render file: 'public/404', status: 404
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
