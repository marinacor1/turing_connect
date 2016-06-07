module Api
  module V1
    class UsersController < Api::ApiController

      def index
        respond_with User.all
      end
    end
  end
end
