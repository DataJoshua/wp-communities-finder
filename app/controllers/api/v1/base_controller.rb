module Api
  module V1
    class BaseController < ActionController::API
      include ActionPolicy::Controller
      include ApiAuthorization
      include JwtAuthentication

      authorize :user, through: :current_user
    end
  end
end
