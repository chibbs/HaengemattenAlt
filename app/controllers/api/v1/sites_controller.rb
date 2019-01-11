class Api::V1::SitesController < Api::V1::BaseController
  # todo: put into serializer
  def index
    serialized = []
    Site.all.each do |site|
      attribute = {
          name: site.name,
          description: site.description,
          user: {
              first: site.user.first_name,
              last: site.user.last_name,
          },
          position: {
              lon: site.longitude.to_f,
              lat: site.latitude.to_f,
          },
          belongs_to_user: site.user == current_user,
          review_count: site.reviews.size,
          detail_page: site_path(site)
      }
      if site.user == current_user
        attribute.merge!(delete: "TODO:IMPLEMENT",
                         edit: edit_site_path(site))
      end
      serialized.push(attribute)
    end
    render(json:serialized)
  end


  def create
    @site = Site.new(site_params)
    @site.user_id = current_user.id

    if params[:site][:size_ids].present?
      sizesgroup = Size.find params[:site][:size_ids]
      @site.sizes = sizesgroup
    end

    if @site.save
      redirect_to sites_url, notice: 'Hängematte wurde angelegt.'
    else
      redirect_to sites_url, notice: 'Hängematte konnte nicht angelegt werden, weil Attribute fehlen.'
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