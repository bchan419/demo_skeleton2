class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @email = params[:email]
    user = User.find_by_email(@email)
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_url, :notice => "Signed in as #{@email}."
    else
      flash[:notice] = "Sign in unsuccessful."
    end
  end
    
  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_url
  end
  
end
