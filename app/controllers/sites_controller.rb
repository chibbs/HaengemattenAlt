class SitesController < ApplicationController
  load_and_authorize_resource
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  def index
	  #@somewhere = [52.477995,13.566360]
	  #@sites = Site.within(5, :origin => @somewhere).order('distance ASC')
	  #@sites = Site.by_distance(:origin => @somewhere).order('distance ASC')
	  #bounds=Geokit::Bounds.from_point_and_radius(@somewhere,5)
    #@sites = Site.includes([:reviews,:sizes]).in_bounds(bounds)
	  #@sites.sort_by{|s| s.distance_to(@somewhere)}

		@sites = Site.joins(:sizes).includes([:sizes, :reviews])
	  #respond_to do |format|
	  #  format.js
	  #end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
	#@site = Site.joins(:reviews).includes(:reviews).find(params[:id])
    @reviews = Review.where(site_id: @site.id).order("created_at DESC")
	respond_to do |format|
		format.html {}
		#format.js {render layout: false} # Add this line to your respond_to block
		format.js # renders show.js.erb
		format.json
	end
  end

  # GET /sites/new
  def new
    @site = Site.new
	
	respond_to do |format|
		format.js
	end
  end

  # GET /sites/1/edit
  def edit
	# html and js like in https://medium.com/@AdamKing0126/ajax-and-rails-demystifying-remote-true-fe51ba2ce819
	respond_to do |format|
		format.html { render :edit }
		format.js {}
	end
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)
    @site.user_id = current_user.id

    if params[:site][:size_ids].present?
      sizesgroup = Size.find params[:site][:size_ids]
      @site.sizes = sizesgroup
    end

    respond_to do |format|
	# see https://guides.rubyonrails.org/working_with_javascript_in_rails.html#a-simple-example
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
		#format.js   # renders create.js.erb, which could be used to redirect via javascript
		format.js { render action: 'show', status: :created, location: @site }
        format.json { render :index, status: :created, location: @site }
      else
        format.html { render :new }
		format.js { render :action => 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    @site.user_id = current_user.id
	if params[:site][:size_ids].present?
	  sizesgroup = Size.find params[:site][:size_ids]
	  @site.sizes = sizesgroup
	end
	
	respond_to do |format|
		  if @site.update(site_params)
			format.html { redirect_to @site, notice: 'Site was successfully updated.' }
			#format.js {redirect_to sites_path(id: @site.id)}
			format.js {}	# like in https://medium.com/@AdamKing0126/ajax-and-rails-demystifying-remote-true-fe51ba2ce819
			format.json { render :show, status: :ok, location: @site }
		  else
			format.html { render :edit }
			format.js { render :edit }
			format.json { render json: @site.errors, status: :unprocessable_entity }
		  end

    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
	  format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.joins(:sizes).includes([:sizes, :reviews]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
	  params.require(:site).permit(:name, :description, :longitude, :latitude, :images, images_attachments_attributes: [:id, :_destroy])
    end
end
