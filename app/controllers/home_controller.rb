class HomeController < ApplicationController
  before_action :skip_verify_authorized!

  def index
    @q = Community.all.ransack(params[:q])
  end
end
