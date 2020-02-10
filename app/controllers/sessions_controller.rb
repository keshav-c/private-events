class SessionsController < ApplicationController
  def new(); end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      cookies.signed[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = "User doesn't exist!"
      render 'new'
    end
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to root_url
  end
end
