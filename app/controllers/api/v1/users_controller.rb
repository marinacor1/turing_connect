module Api
  module V1
    class UsersController < Api::ApiController

      def index
        respond_with User.all
      end

      def update
        user = User.find(params['id'])
        if user.update(user_params)
          respond_with user
          flash.now[:error] = "Success! Your account updated."
          User.update_newsfeed(params)
        else
          flash.now[:error] = "Your account could not be updated. Please check your input and try again."
        end

      end

  private

    def user_params
      params.require(:user).permit(:cohort, :name, :current_employer, :street_address, :city, :state, :email, :status)
    end

    end
  end
end
