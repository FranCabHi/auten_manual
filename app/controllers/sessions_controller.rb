class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      render :new, notice: "Usuario o clase incorrecta"
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
