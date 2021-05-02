class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)    
        respond_to do |format|
          if @user.save
            session[:user_id] = @user.id
            format.html { redirect_to root_path, notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

    def show
      @user = User.includes(:stories).find(helpers.current_user.id)
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Signed out successfully."
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end