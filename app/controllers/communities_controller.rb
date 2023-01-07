class CommunitiesController < ApplicationController
    before_action :authenticate_current_user!, only: %i[new]
    before_action :set_community, only: %i[edit show update destroy]
    before_action ->{authorize! Community}, only: %i[index show]
    before_action ->{authorize! @community}, only: %i[edit update destroy]

    def show
    end

    def index
        @communities = Community.all
                                .page(params[:page])
                                .order(params[:sort])
                                .per(6)
    end

    def new
        @community = Community.new
        @categories = Category.all
        authorize! @community
    end

    def create
        @community = create_community.community
        @categories = Category.all
        authorize! @community

        if create_community.success? 
            flash[:notice] = "New community created!"
            redirect_to @community
        else
            flash.now[:alert] = "something went wrong!"
            render :new
        end
    end

    def edit
    end

    def update
        if update_community.success?
            flash[:notice] = "community edited!"
            redirect_to @community
        else
            flash[:alert] = "something went wrong!"
            render :edit
        end
    end

    def destroy
        destroy_community
        flash[:notice] = "community deleted!"
        redirect_to communities_path
    end

    private

    def update_community
        @update_community ||= 
            Communities::Update.call(community_params: community_params, community: @community)
    end

    def destroy_community
        @destroy_community ||= 
            Communities::Destroy.call(community: @community)
    end

    def create_community
        @create_community ||= 
            Communities::Create.call(community_params: community_params, user: current_user)
    end

    def set_community
        @community = Community.find(params[:id])
    end

    def community_params
        params.require(:community).permit(:name, :description, :url, :category_id)
    end

end

