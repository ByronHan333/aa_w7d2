class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show, :index]
  before_action :require_logged_out, only: [:new]

  def index
    redirect_to user_url(current_user)
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      flash[:messages] = ["User created"]
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:messages] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

end
