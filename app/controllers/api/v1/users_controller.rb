module Api
  module V1
    class UsersController < Api::ApiController

      def index
        respond_with User.all
      end

      def update
        user = User.find(params['id'])
        if user.update(user_params)
          User.update_newsfeed(params)
          render json: {response: "successful"}
        else
          render json: {response: "failed"}
        end

      end

  private

    def user_params
      params.require(:user).permit(:cohort, :name, :current_employer, :street_address, :city, :state, :email, :status)
    end

    end
  end
end
