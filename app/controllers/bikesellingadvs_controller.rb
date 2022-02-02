class BikesellingadvsController < ApplicationController
    def new
        authorize! :new, Bikesellingadv, :message => "You are not authorized"
    end
  
    def create
        authorize! :create, Bikesellingadv, :message => "You are not authorized"
        @bikesellingadv = current_user.bikesellingadvs.new(bikesellingadv_params)
        if @bikesellingadv.check
            @bikesellingadv.save
            redirect_to user_bikesellingadvs_path(@bikesellingadv.user)
        else
            redirect_to new_user_bikesellingadv_path(current_user.id)
        end
    end
  
    def findadv 
        authorize! :findadv, Bikesellingadv, :message => "You are not authorized"
        @bikesellingadvs = Bikesellingadv.search_by(params[:user_id],params[:par])
    end
  
    def index 
        authorize! :index, Bikesellingadv, :message => "You are not authorized"
        @bikesellingadvs = User.find(params[:user_id]).bikesellingadvs
    end
  
    def edit
        authorize! :edit, Bikesellingadv, :message => "You are not authorized"
        @bikesellingadv = User.find(params[:user_id]).bikesellingadvs.find(params[:id])
    end
  
    def update
        authorize! :update, Bikesellingadv, :message => "You are not authorized"
        @bikesellingadv = User.find(params[:user_id]).bikesellingadvs.find(params[:id])
        if @bikesellingadv.update(bikesellingadv_params)
          redirect_to user_bikesellingadvs_path(@bikesellingadv.user)
        else
          render :edit
        end
    end
  
    def destroy
        authorize! :destroy, Bikesellingadv, :message => "You are not authorized"
        @bikesellingadv = User.find(params[:user_id]).bikesellingadvs.find(params[:id])
        @bikesellingadv.destroy
        redirect_to user_bikesellingadvs_path(@bikesellingadv.user)
    end
  
    private
    def bikesellingadv_params
        params.require(:bikesellingadv).permit(:start_date, :end_date, :city, :par)
    end
end
