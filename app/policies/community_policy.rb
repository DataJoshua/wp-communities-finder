class CommunityPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def show?
    true
  end

  def index?
    true
  end

  def new?
    create?
  end

  def create?
    user.present?
  end

  def edit?
    update?
  end

  def update?
    user.present? && owner?
  end

  def destroy?
    user.present? && owner?
  end

  private

  def owner?
    record.user == user
  end
end
