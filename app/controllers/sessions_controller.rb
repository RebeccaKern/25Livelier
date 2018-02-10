class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.find_by_andrew_id(params[:andrew_id])
      if user && User.authenticate(params[:andrew_id], params[:password])
        session[:user_id] = user.id
        redirect_to home_path, notice: "Logged in!"
      else
        flash.now.alert = "andrew_id or password is invalid"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to home_path, notice: "Logged out!"
    end
  end