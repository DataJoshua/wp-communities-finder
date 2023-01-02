module Communities
  class Save
    include Interactor
    
    delegate :community_params, to: :context

    def call
        context.community = community

        context.fail!(error: "Invalid") unless community.save
    end

    private

    def community
        @community ||= Community.new(community_params)
    end

  end
end