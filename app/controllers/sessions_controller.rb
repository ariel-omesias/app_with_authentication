class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Logged in!"
    else
      redirect_to root_path :notice => "Invalid Email/Password combination!"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url, :notice => "logged Out!"
  end
end
