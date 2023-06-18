module Admin
  class AdminController < ActionController::Base
    layout "application"
    include Authentication
    include Authorization
  end
end