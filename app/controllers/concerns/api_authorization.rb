module ApiAuthorization
  extend ActiveSupport::Concern

  included do
    verify_authorized
  
    rescue_from ActionPolicy::Unauthorized, with: :deny_access!
  end

  def deny_access!
    render json: { msg: "You are not authorized" }
  end
end