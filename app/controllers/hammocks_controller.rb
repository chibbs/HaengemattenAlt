class HammocksController < ApplicationController
  before_action :set_hammock, only: [:show, :edit, :update, :destroy]
  
  # GET \hammocks
  def index
    @hammocks = Hammock.all
  end
  
  def show
    @hammock = Hammock.find(params[:id])
  end
  
  def new
    @hammock = Hammock.new
  end
  
  def edit
    @hammock = Hammock.find(params[:id])
  end
  
  def create
	@hammock = Hammock.new(hammock_params)
 
    if @hammock.save
      redirect_to @hammock
    else
      render 'new'
    end
  end
  
  def update
    @hammock = Hammock.find(params[:id])
 
    if @hammock.update(hammock_params)
      redirect_to @hammock
    else
      render 'edit'
    end
  end
  
  def destroy
    @hammock = Hammock.find(params[:id])
    @hammock.destroy
 
    redirect_to hammocks_path
  end
 
  # Never trust parameters from the scary internet, only allow the white list through.
  private
    def hammock_params
      params.require(:hammock).permit(:name, :description, :longitude, :latitude)
    end
  end
