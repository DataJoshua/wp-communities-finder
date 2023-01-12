class SessionPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def new?
    create?
  end

  def create?
    user.blank?
  end

  def destroy?
    user.present?
  end
end
