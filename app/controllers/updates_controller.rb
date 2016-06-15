class UpdatesController < ApplicationController
  def index
    @updates = Update.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
  end
end
