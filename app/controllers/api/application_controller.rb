module Api
  class ApplicationController < ActionController::API
    include JwtAuthentication
  end
end
