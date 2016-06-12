class Admin::UsersController < Admin::BaseController

  def show
    @user = current_user
  end

  def index
    users = User.all
    @users = users.where.not(name: nil)
  end

end
