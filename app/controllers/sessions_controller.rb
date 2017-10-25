class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:session][:username_or_email], params[:session][:password])
    if user
      # Log the user in and redirect to the user's show page.
      flash.now[:success] = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa YOU LOGGED!!!!!"
      log_in user
      redirect_to root_path
    else
      # Create an error message.
      flash.now[:danger] = "NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO WRONG!!!!"    
      render 'new'
    end
  end

  def destroy
  end
end
