class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_sitesref, only: [:index, :destroy]

  # GET /reviews
  def index
    if params[:site].blank?
		# get all reviews and their corresponding sites and order them descending
		@reviews = Review.joins(:site).order(created_at: :desc).includes(:site)
	else
		# for filtering by site in review list
		# get all reviews which belong to site name in parameter, order them descending and also get corresponding site
		@reviews = Review.joins(:site).where( sites: { name: params[:site] }).order(created_at: :desc).includes(:site)
	end
  end

  # GET /reviews/1
  def show
	@review = Review.joins(:site).includes(:site).find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
	@review.user_id = current_user.id

    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reviews/1
  def update
	@review.user_id = current_user.id
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end
	
	# load all sites that are referenced by reviews for use in filter
	def set_sitesref
      @sitesref = Site.joins(:reviews).group('name')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment, :site_id)
    end
end
