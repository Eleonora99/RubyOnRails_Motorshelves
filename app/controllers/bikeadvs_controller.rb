class BikeadvsController < ApplicationController

    def new
      authorize! :new, Bikeadv, :message => "You are not authorized"
    end

    def create
      authorize! :create, Bikeadv, :message => "You are not authorized"
      @bikeadv = current_user.bikeadvs.create(bikeadv_params)
      redirect_to user_bikeadvs_path(@bikeadv.user)
    end

    def findadv 
      authorize! :findadv, Bikeadv, :message => "You are not authorized"
      @bikeadvs = Bikeadv.search_by(current_user.id,params[:search_by],params[:par])
    end

    def index 
      authorize! :index, Bikeadv, :message => "You are not authorized"
      @bikeadvs = User.find(params[:user_id]).bikeadvs
    end

    def edit
      authorize! :edit, Bikeadv, :message => "You are not authorized"
      @bikeadv = User.find(params[:user_id]).bikeadvs.find(params[:id])
    end

    def update
      authorize! :update, Bikeadv, :message => "You are not authorized"
      @bikeadv = User.find(params[:user_id]).bikeadvs.find(params[:id])
      if @bikeadv.update(bikeadv_params)
        redirect_to user_bikeadvs_path(@bikeadv.user)
      else
        render :edit
      end
    end

    def show
      authorize! :show, Bikeadv, :message => "You are not authorized"
      @bikeadv = Bikeadv.find(params[:id])
    end

    def destroy
      authorize! :destroy, Bikeadv, :message => "You are not authorized"
      @bikeadv = User.find(params[:user_id]).bikeadvs.find(params[:id])
      @bikeadv.destroy
      redirect_to user_bikeadvs_path(@bikeadv.user)
    end

    private
    def bikeadv_params
      params.require(:bikeadv).permit(:scuderia, :modello, :cilindrata, :anno, :city, :description, :advices, :image, :searchby,:par)
    end
end

