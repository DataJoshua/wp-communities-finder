module Api
  module V1
    class BaseController < ActionController::API
      include ActionPolicy::Controller
      include ApiAuthorization
      include JwtAuthentication
    end
  end
end
