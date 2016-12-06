class Api::UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :show]
  before_action :set_all_user, only: [:index]
  skip_before_filter :authenticate_user!, only: [:destroy, :show]
  respond_to :json

  def show
    if !@user.nil?
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
    if !@users.empty?
      render json: {
                      success: true,
                      response: @users
                    }
    else
      render json: {
                      success: false,
                      info: "The user doesn't exist."
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

  private

    def set_user
      @user = User.find(params[:id])
    end

    def set_all_user
      @users = User.all
    end
end
