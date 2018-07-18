class SessionsController < ApplicationController
  
  def new
   
  end
  
  def create
   #handles forms submission
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id]= user.id
      flash[:success] = "you have successfully logged in"
      redirect_to user_path(user)
      
    else
      flash[:danger] = "There is something wrong with login credentials"
      render 'new'
    end
  end
  
  def destroy
  #stops session  
    session[:user_id] = nil
    flash[:success] = "you have logged out"
    redirect_to root_path
  end
  
end