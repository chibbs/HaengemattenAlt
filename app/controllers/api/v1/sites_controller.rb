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
        #attribute.merge!(delete_button: (button_to "Löschen",  site, method: :delete, :class => "btn btn-danger btn-block" , confirm: 'Are you sure?'),
        #edit_button: (button_to "Bearbeiten", edit_site_path(site), :class => "btn btn-primary btn-block", :method => :get))
      end
      serialized.push(attribute)
    end
    render(json:serialized)
  end
end