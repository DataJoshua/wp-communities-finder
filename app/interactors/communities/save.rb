module Communities
  class Save
    include Interactor

    delegate :community_params, :user, to: :context

    def call
      context.community = community

      context.fail!(error: community.errors.full_messages) unless community.save
    end

    private

    def community
      @community ||= Community.new(community_params.merge({ user: user }))
    end
  end
end
