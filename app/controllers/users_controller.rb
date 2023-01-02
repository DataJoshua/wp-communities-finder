class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to root_path
    else
      flash[:alert] = "User creation failed"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :nickname, :password, :email)
  end

end
