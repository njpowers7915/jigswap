class UsersController < ApplicationController
    # before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user && @user.save
            log_user_in
        else
            raise "Add error handling here!".inspect
        end
    end

    def update
        if @user.update(user_params)
            format.json { render json: @user }
        else
            raise "Add error handling here!".inspect
        end
    end

    def destroy
        @user.delete
    end

    private

    def set_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password, :email, :admin, :location_id)
    end
end