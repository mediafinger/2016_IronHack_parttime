class SessionsController < ApplicationController
  # GET login form
  def new
    session[:return_to] ||= request.referer
  end

  # POST to login
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back #{user.name}!"
      redirect_to session.delete(:return_to) || projects_path
    else
      flash.now[:alert] = "Login failed, please try again."
      render :new
    end
  end

  # DELETE logout
  def destroy
    session.clear
    redirect_to root_path
  end
end
