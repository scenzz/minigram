class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user  = User.find(params[:id])
    @grams = @user.grams.order(id: :desc).page(params[:page]).per(5)
  end
end
