class UsersController < ApplicationController
    before_action :set_users, only: [:sign_in]

    def show
        user = User.find(params[:id])
            render json: user
    end

    def sign_up
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors, status: :unprocessable_entit
        end
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
        if @user.nil?
            render json: 'Not found user', status: 404
        end
    end
end
