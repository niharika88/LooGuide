class UsersController < ApplicationController

  def show
    binding.pry
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path, notice: "Thanks for signing up!"
    else
      render :new
    end
  end


  private



  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end