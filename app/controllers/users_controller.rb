class UsersController < ApplicationController


def new
  render :new
end

def create
  @user = User.new(user_params)
  if @user.save
    redirect_to "vnsdgkljweoifjefjln"
  else
    flash[:errors] = @user.errors.full_messages
    render :new
  end
end

def user_params
  params.require(:user).permit(:username, :password)
end


end
