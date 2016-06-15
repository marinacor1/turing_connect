class StudentsController < ApplicationController
  def index
    users = User.all
    @users = users.where.not(name: nil).paginate(page: params[:page], per_page: 15)
  end

end
