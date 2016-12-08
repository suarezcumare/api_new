class Api::UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :show]
  before_action :set_all_user, only: [:index]
  #skip_before_filter :authenticate_user!, only: [:log_in, :create]
  before_action :authenticate_user!, except: [:log_in, :create, :index]
  respond_to :json

  def show
    unless @user.nil?
      render json: {
                      success: true,
                      response: UserSerializer.new(@user).serializable_hash
                    }
    else
      render json: {
                      success: false,
                      info: "The user doesn't exist."
                    }
    end
  end

  def index
    unless @users.empty?
      render json: {
                      success: true,
                      response: @users
                    }
    else
      render json: {
                      success: false,
                      info: "The users doesn't exist."
                    }
    end
  end

  def destroy
    @user.destroy
    if @user.errors.empty?
      render json: {
                      success: true,
                      response: @user.to_json
                    }
    else
      render json: {
                      success: false,
                      info: @user.errors.to_json
                    }
    end
  end

  def log_in
    puts "AAAAAAAAAAAAAAAAAA"
    puts params
    puts params[:user]
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) 
        sign_in(@user)
        render json: {
                      success: true,
                      response: UserSerializer.new(@user).serializable_hash
                    }
      else
        render json: {
                      success: false,
                      info: "Please enter the valid password."
                    }
      end

    else
      render json: {
                      success: false,
                      info: "Please enter the valid email."
                    }
    end
  end

  def create
    @user = User.new(params_user)
    if @user.save
      sign_in(@user)
      render json: {
                      success: true,
                      response: @user
                    }
    else
      render json: {
                      success: false,
                      info: @user.errors
                    }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def set_all_user
      @users = User.all
    end

    def params_userlog_in
      params(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end
end
