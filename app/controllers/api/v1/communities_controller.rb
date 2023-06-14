module Api
  module V1
    class CommunitiesController < Api::V1::BaseController
      before_action :authenticate_user!, only: %i[create destroy update]
      before_action :set_community, only: %i[show destroy update]

      before_action ->{ authorize! Community }, only: %i[index create show]

      def index
        @communities = Community.all
        render json: @communities 
      end

      def show
        render json: { community: @community }
      end

      def create
        @community = create_community.community

        if create_community.success?
          render json: { community: @community }  
        else
          render json: { msg: create_community.error }
        end
      end

      def destroy
        authorize! @community
        if  @community.destroy
          render json: { community: @community, msg: "Community Destroyed succesfully" }
        else
          render json: { msg:  "something went wrong" }
        end
      end

      def update
        authorize! @community
        
        if update_community.success?
          render json: @community
        else
          render json: { msg: update_community.error }
        end
      end

      private

      def set_community
        @community = Community.find(params[:id])
      end

      def community_params
        params.require(:community).permit(:name, :description, :url, :category_id)
      end

      def create_community
        @create_community ||= Communities::Create.call(community_params: community_params, user: current_user)
      end

      def update_community
        @update_community ||= Communities::Update.call(community: @community, community_params: community_params)
      end
    end
  end
end
