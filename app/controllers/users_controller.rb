class UsersController < ApplicationController
  def new
    @user = User.new 
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to root_url
    else
      redirect_to new_user_url
      flash[:notice] = user.errors.full_messages
    end
  end


  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
