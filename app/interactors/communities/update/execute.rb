module Communities
    class Update
      class Execute
        include Interactor
        
        delegate :community, :community_params, to: :context

        def call
            context.fail!(error: "Invalid") unless community.update(community_params)
        end
          
      end
    end
  end