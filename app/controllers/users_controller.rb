class UsersController < ApplicationController
  before_action -> { authorize! User }

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User created successfully'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :nickname, :password, :email)
  end

  def authenticate_user
    @authenticate_user ||= Users::GenerateToken.call(credentials: user_params)
  end
end
