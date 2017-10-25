class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:session][:username_or_email], params[:session][:password])
    if user
      # Log the user in and redirect to the user's show page.
      log_in user      
      flash[:success] = "Welcome back, " + user.username
      redirect_to root_path
    else
      # Create an error message.
      flash.now[:danger] = "Wrong email/usename/password"    
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
