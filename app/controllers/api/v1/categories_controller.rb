module Api
  module V1
    class CategoriesController < Api::V1::BaseController
      before_action :set_category, only: %i[show]
      before_action -> { authorize! Category }

      def index
        @categories = Category.all

        render json: @categories
      end

      def show 
        render json: { category: @category }
      end

      private

      def set_category
        @category ||= Category.find(params[:id])
      end
    end
  end
end
