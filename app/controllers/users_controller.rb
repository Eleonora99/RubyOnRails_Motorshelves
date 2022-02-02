class UsersController < ApplicationController

    def show
        @user = current_user
        if @user.firstname==nil
            redirect_to edit_user_path(@user.id)
        end
    end

    def edit
        @user = current_user
    end
  
    def update
        @user = current_user
        @user.set_basic
        if @user.update(user_params)
        redirect_to @user
      else
        render :edit
      end
    end

    def destroy
        current_user.destroy
        redirect_to root_path
    end

    def index 
        authorize! :index, User, :message => "You are not authorized"
        @users = User.all
      end
  
    def ban
        authorize! :ban, User, :message => "You are not authorized"
        user = User.find(params[:id])
        user.unset_basic
        redirect_to users_path
    end
    
    def unban
        authorize! :unban, User, :message => "You are not authorized"
        user = User.find(params[:id])
        user.set_basic
        redirect_to users_path
    end
    
    def admin
        authorize! :admin, User, :message => "You are not authorized"
        user = User.find(params[:id])
        user.set_basic
        user.set_admin
        redirect_to users_path
    end
    
    def unadmin
        authorize! :unadmin, User, :message => "You are not authorized"
        user = User.find(params[:id])
        user.unset_admin
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :dateofbirth, :gender)
    end

end
