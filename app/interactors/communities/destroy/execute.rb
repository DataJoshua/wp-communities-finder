module Communities
  class Destroy
    class Execute
        include Interactor

        delegate :community, to: :context

        def call
            context.fail!(error: "Invalid") unless community.destroy
        end
    end
  end
end