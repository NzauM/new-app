class UsersController < ApplicationController
    def index 
        render json: User.all
    end

    def create 
        user = User.create(userparams)
        if user.valid?
            render json: user, status: :created
        else
            render json: {error: "Invalid user"}, status: :unprocessable_entity
        end
    end

    private
    def userparams
        params.permit(:username, :email, :bio, :password, :password_confirmation)
    end
end
