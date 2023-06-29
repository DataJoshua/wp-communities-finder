class CommunitiesController < ApplicationController

  expose :community
  expose :categories, ->{ Category.all }
  expose :q, :set_ransack
  expose :communities, ->{ q.result
                   .page(params[:page])
                   .order(params[:sort])
                   .per(4) }

  before_action :authenticate_current_user!, only: %i[new create update edit destroy]
  before_action -> { authorize! Community }, only: %i[index show new create]
  before_action -> { authorize! community }, only: %i[edit update destroy]

  def show; end

  def index
  end

  def new
  end

  def create
    if create_community.success?
      flash[:success] = 'New community created!'
      redirect_to community
    else
      flash.now[:warning] = create_community.error
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if update_community.success?
      flash[:success] = 'community edited!'
      redirect_to community
    else
      flash[:warning] = 'something went wrong!'
      render :edit
    end
  end

  def destroy
    destroy_community
    flash[:success] = 'community deleted!'
    redirect_to communities_path
  end

  private

  def update_community
    @update_community ||=
        Communities::Update.call(community_params:, community: community)
  end

  def set_ransack
    Community.all.order("id DESC").ransack(params[:q])
  end

  def destroy_community
    @destroy_community ||=
        Communities::Destroy.call(community: community)
  end

  def create_community
    @create_community ||=
        Communities::Create.call(community_params: community_params, user: current_user)
  end

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:name, :description, :url, :category_id, :social)
  end
end
