module Authentication
  extend ActiveSupport::Concern

  class UnAuthenticated < StandardError; end

  included do
    rescue_from UnAuthenticated, with: :user_not_authenticate

    helper_method :current_user
  end

  def authenticate_current_user!
    return if current_user.present? && session[:current_user_id]

    raise UnAuthenticated, 'not logged in'
  end

  def current_user
    @user ||= User.find_by(id: session[:current_user_id])
  end

  def user_not_authenticate
    flash[:warning] = 'You are not logged in!'
    redirect_to login_path
  end
end
