class UsersController < ApplicationController
    def sign_up
        user = User.new(user_params)
    end

    def sign_in

    end

    require
    def user_params
        params.permit(:nick_name, :login_id, :password)
    end
end
