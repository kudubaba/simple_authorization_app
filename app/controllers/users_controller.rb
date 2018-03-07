class UsersController < ApplicationController

  # shows register form
  def new
    @user = User.new
  end

  # post request to reg a new user
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  # shows edit form
  def edit
    unless session[:user_id].nil?
      @user = User.find(session[:user_id])
      if @user.id != params[:id].to_i
        redirect_to edit_user_path(@user)
      end
    else
      flash[:errors] = ["You must be logged in to go there"]
      redirect_to login_path
    end
  end

  #post request to update user info
  def update

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)

  end
end
