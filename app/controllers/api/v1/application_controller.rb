module Api
  module V1
    class ApplicationController < ActionController::API
      include ActionPolicy::Controller
      include JwtAuthentication
      include ApiAuthorization

      authorize :user, through: :current_user    
    end
  end
end
