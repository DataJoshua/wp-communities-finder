class HomeController < ApplicationController
    
    before_action :skip_verify_authorized!

    def index
    end
end
