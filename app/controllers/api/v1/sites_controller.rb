class Api::V1::SitesController < Api::V1::BaseController
  before_action only: [:show, :edit, :update, :destroy]
  # todo: put into serializer
  def index
    serialized = []
    Site.all.each do |site|
      attribute = format_site(site)
      serialized.push(attribute)
    end
    render(json:serialized)
  end

  def show
    @site = Site.joins(:sizes).includes([:sizes, :reviews]).find(params[:id])
    if @site == nil
      render(json:{"error": "Key not found"})
    else
	  render(json:format_site(@site))
    end
  end

  def format_site(site)
    attribute = {
        name: site.name,
        id: site.id,
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
        detail_page: site,
        sizes: format_sizes(site.sizes)
    }
    if site.user == current_user
      attribute.merge!(delete: "TODO:IMPLEMENT",
                       edit: edit_site_path(site))
    end
    attribute
  end

  def format_sizes(sizes)
    attribute = []
    sizes.all.each do |size|
      attribute.push(size.name)
    end
    attribute
  end

end