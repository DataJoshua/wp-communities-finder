module Admin
  class CommunityPolicy < Admin::AdminPolicy
    def index?
      admin?
    end

    def show?
      admin?
    end

    def destroy?
      admin?
    end
  end
end