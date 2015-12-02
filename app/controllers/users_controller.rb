class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      redirect_to login_path, :notice => "Now please login"
    else
      binding.pry
      render :new
    end
  end

  def show
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :public_profile)
    end
end
