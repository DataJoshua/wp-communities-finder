module JwtAuthentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    return if authentication_token.blank?

    User.find_by(id: payload["sub"])
  end

  def authentication_token
    @authentication_token ||= request.headers['Authorization']&.split&.last
  end

  def payload
    ::JWT.decode(authentication_token, jwt_secret, true, {algorithm: "HS256" }).first
  end

  def jwt_secret
    ENV.fetch("JWT_SECRET")
  end

  def authenticate_user!
    return if current_user.present?

    render json: { msg: "Not logged In!" }
  end

end
