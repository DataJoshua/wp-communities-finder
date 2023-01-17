class CategoriesController < ApplicationController
  before_action -> { authorize! Category }

  def show
    @category = Category.find(params[:id])
    @q = @category.communities.ransack(params[:q])
    @communities = @q.result
                     .page(params[:page])
                     .per(5)
  end
end
