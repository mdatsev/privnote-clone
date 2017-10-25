class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:session][:username_or_email], params[:session][:password])
    if user
      # Log the user in and redirect to the user's show page.
      puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa YOU LOGGED!!!!!"
    else
      # Create an error message.
      puts "NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO WRONG!!!!"    
      render 'new'
    end
  end

  def destroy
  end
end
