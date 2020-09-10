class UsersController < ApplicationController

  def index
    @users = User.all
    if @users
      render json: {
        users: @users
      }
    else
      render json: {
        status: 500,
        errors: ['no users found']
      }
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: {
        status: :created,
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: @user.errors.full_messages
      }
    end
  end

  def find_user
    @users = User.all
    @users = User.find(params[:id])
    if @users
      render json: {
        code: 200,
        data: @users.as_json
      }
    else
      render json: @users.errors.messages
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
