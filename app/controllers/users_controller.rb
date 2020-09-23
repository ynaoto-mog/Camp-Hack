class UsersController < ApplicationController
    before_action :set_users, only: [sign_in]
    def sign_up
        user = User.new(user_params)
        render json: user
    end

    def sign_in
        render json: @user
    end

    private
    def user_params
        params.permit(:nick_name, :login_id, :password)
    end

    def set_users
        @user = User.find_by(login_id: params[:id], password: params[:password])
    end
end
