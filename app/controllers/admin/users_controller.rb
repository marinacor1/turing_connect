class Admin::UsersController < Admin::BaseController

  def show
    @user = current_user
  end

  def index
    @users = User.all.compact
    binding.pry
  end

end
