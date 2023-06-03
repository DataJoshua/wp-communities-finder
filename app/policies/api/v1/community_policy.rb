module Api
  module V1
    class CommunityPolicy < ApplicationPolicy
      def destroy?
        user.present? && owner?
      end

      private

      def owner?
        record.user == user
      end

    end
  end
end
