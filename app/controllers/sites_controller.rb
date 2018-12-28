class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  def index
      @sites = Site.all
  end

  # GET /sites/1
  def show
    @reviews = Review.where(site_id: @site.id).order("created_at DESC")
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  def create
    @site = Site.new(site_params)

	sizesgroup = Size.find params[:site][:size_ids]
	@site.sizes = sizesgroup
	
    if @site.save
      redirect_to @site, notice: 'Site was successfully created.' 
    else
      render :new
    end
  end

  # PATCH/PUT /sites/1
  def update
	#@site.sizes.clear
    #params[:site][:size_ids].each do |size_id|
	#	unless size_id.empty?
	#		size = Size.find(size_id)
	#		@site.sizes << size
	#	end
	#end

	sizesgroup = Size.find params[:site][:size_ids]
	@site.sizes = sizesgroup
	
    if @site.update(site_params)
      redirect_to @site, notice: 'Site was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sites/1
  def destroy
    @site.destroy
      redirect_to sites_url, notice: 'Site was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :description, :longitude, :latitude)
    end
end
