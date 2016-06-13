class Admin::BaseController < ApplicationController
  before_action :check_guest
  before_action :require_admin

  def check_guest
    render file: "/public/404" if current_user.nil?
  end

  def require_admin
    render file: "/public/404" unless current_user.admin?
  end
end
