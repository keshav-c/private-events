class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies.signed[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = "User already in db!" if User.exists?(name: user_params[:name])
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.all
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end
end
