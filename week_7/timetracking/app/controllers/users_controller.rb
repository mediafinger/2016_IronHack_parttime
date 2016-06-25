class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user && @user.valid?
      WelcomeMailer.welcome_mail(@user).deliver_later

      flash[:notice] = "Welcome - please login!"
      redirect_to root_path
    else
      flash.now[:alert] = "User could not be created"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
