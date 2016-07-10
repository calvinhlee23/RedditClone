class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = user.find_by_credential(
          params[:user][:email],
          params[:user][:password]
    )
    if user
      login!(user)
      redirect_to root_url
    else
      render :new
      flash[:notice] = "email/password combination not found"
    end
  end

  def destroy
    logout!(@current_user)
    redirect_to root_url
  end


  private

  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
