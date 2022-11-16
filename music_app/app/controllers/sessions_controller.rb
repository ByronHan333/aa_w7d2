class SessionsController < ApplicationController

  def new
    if logged_in?
      require_logged_out
    else
      render :new
    end
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
    if logged_in?
      logout
      redirect_to new_session_url
    else
      require_logged_in
    end
  end
end
