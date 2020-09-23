class UsersController < ApplicationController
    before_action :set_users, only: [:sign_in]
    def sign_up
        user = User.new(user_params)
        render json: user
    end

    def sign_in
        render json: @user
    end

    private
    def user_params
        params.permit(:nickname, :username, :password)
    end

    def set_users
        @user = User.find_by(username: params[:id], password: params[:password])
    end
end
