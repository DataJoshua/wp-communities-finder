module Api
  module V1
    class CommunitiesController < Api::ApplicationController
      before_action :authenticate_user!, only: %i[create destroy]
      before_action :set_community, only: %i[show destroy]

      def index
        @communities = Community.all
        render json: {communities: @communities}
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
        if  @community.destroy
          render json: { community: @community, msg: "Community Destroyed succesfully" }
        else
          render json: { msg:  "something went wrong" }
        end
      end

      # TODO: implement edit
      def edit

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
    end
  end
end
