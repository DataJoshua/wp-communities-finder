class SessionsController < ApplicationController
    
    before_action :authenticate_current_user!, only: %i[show]

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: user_params[:email])
            &.authenticate(user_params[:password])
        if @user
            session[:current_user_id] = @user.id
            flash[:notice] = "You logged in successfully #{@user.first_name}"
            redirect_to root_path
        else
            flash[:alert] = "Something went wrong"
            render :new
        end
    end

    def destroy
        session[:current_user_id] = nil
        flash[:alert] = "You logged out"
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
