# frozen_string_literal: true

class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    unless @user
      flash[:alert] = "Login failed - Email doesn't exist"
      return redirect_to new_user_session_path
    end
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = 'Login failed - Password wrong'
      redirect_to new_user_session_path
    end
  end

  def destroy
    Rails.logger.debug 'destroy'
    session[:user_id] = nil
    redirect_to new_user_session_path
  end
end
