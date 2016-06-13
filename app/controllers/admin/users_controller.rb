class Admin::UsersController < Admin::BaseController

  def show
    @user = current_user
    @id = current_user.id
  end

  def index
    users = User.all
    @users = users.where.not(name: nil).paginate(page: params[:page], per_page: 12)
  end

end
