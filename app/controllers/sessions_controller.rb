class SessionsController < ApplicationController
  def new
  end


 def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user&.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:notice] = "Logged in successfully"
    redirect_to user
  else
    flash.now[:alert] = "Invalid email or password"
    render 'new'
  end
rescue BCrypt::Errors::InvalidHash
  flash.now[:alert] = "There was an error with the password format. Please reset your password."
  render 'new'
end


  def destroy
        session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end