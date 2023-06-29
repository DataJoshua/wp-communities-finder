module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :skip_verify_authorized!
      before_action :authenticate_user!, only: %i[show]

      def create
        @user = create_user.user
        if create_user.success?
          render json: { user: @user, msg: "user created" }
        else
          render json: { msg: create_user.error }
        end
      end

      def login
        if authenticate_user.success?
          render json: { jwt_token: authenticate_user.authentication_token }
        else
          render json: authenticate_user.error
        end
      end

      def show
        render json: { user: current_user, communities: current_user.communities}
      end

      private

      def create_user
        @create_user ||= Users::Create.call(user_params: user_params)
      end

      def user_params
        params.require(:user).permit(:first_name, :nickname, :email, :password)
      end

      def auth_params
        params.permit(:email, :password)
      end

      def authenticate_user
        @authenticate_user ||= Users::GenerateToken.call(credentials: auth_params)
      end

    end
  end
end
