class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]
  before_action :require_logged_out, only: [:new]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login(@user)
      flash[:messages] = ["User found"]
      redirect_to user_url(@user)
    else
      # flash[:errors] =  @user.errors.full_messages
      flash[:messages] = ["User not found"]
      redirect_to new_session_url
      # require_logged_in
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
