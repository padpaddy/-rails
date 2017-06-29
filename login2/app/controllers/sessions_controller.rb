class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if (user && user.password == params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You login success."
      redirect_to root_path
    else
      flash[:notice] = "Email or password is false."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
