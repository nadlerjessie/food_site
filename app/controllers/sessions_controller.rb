class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    @user = User.find_by(:email => params[:email])
    binding.pry
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private
    def login(user)
      session[:user_id] = user.id
    end
end
