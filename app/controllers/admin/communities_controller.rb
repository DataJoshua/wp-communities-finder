module Admin
  class CommunitiesController < Admin::AdminController
    before_action :authenticate_current_user!
    before_action ->{ authorize! Community }

    expose :communities, ->{ Community.all }

    def index
    end

    def destroy
      @community = Community.find(params[:id])

      @result = destroy_community.success?
      
      respond_to do |format|
        format.turbo_stream
      end
    end

    private

    def destroy_community
      @destroy_community ||= Communities::Destroy.call(community: @community )
    end
  end
end