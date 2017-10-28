class UsersController < ApplicationController  

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome aboard!"
      redirect_to root_path
    else
      @errors = @user.errors
      render 'new'
    end   
  end

  def show
    if current_user != @user = User.find_by(id: params[:id])
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end 

end