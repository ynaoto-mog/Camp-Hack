class UsersController < ApplicationController
    before_action :set_users, only: [:sign_in]
    def sign_up
        user = User.create(user_params)
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
        @user = User.find_by(username: params[:username], password: params[:password])
        if @user.nil
            render json: message: 'Not found user', status: :404
    end
end
