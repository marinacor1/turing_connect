module Api
  module V1
    class UsersController < Api::ApiController

      def index
        respond_with User.all
      end

      def update
        User.update_newsfeed(params)
        respond_with User.update(params['id'], user_params)
      end

  private

    def user_params
      params.require(:user).permit(:cohort, :name, :current_employer, :street_address, :city, :state, :email, :status)
    end

    end
  end
end
