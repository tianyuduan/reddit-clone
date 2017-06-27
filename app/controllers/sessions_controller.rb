class SessionsController < ApplicationController

  before_action :require_logged_in, only: [:destroy]
  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user  = User.find_by_credentials(params[:user][:username],params[:user][:password])
    # @user = User.find_by_user(session_params)
    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash[:errors] = ["INvalid sign in credentials"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end


  # def session_params
  #   params.require(:user).permit(:username, :password)
  # end



end
