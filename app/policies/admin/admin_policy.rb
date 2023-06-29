module Admin
  class AdminPolicy < ActionPolicy::Base
    def admin?
      user.admin?  
    end
  end
end
