class Api::V1::ReviewsController < Api::V1::BaseController
  def index
    if params[:sites_id]
      site = Site.where(id: params[:sites_id]).first
      unless site.nil?
        render(json:site.reviews)
      end
      render(json:[])
      return
    end
    render(json:format_all(Review.all))
  end

  def format_all(reviews)
    serialized = []
    reviews.each do |site|
      attribute = format_review(site)
      serialized.push(attribute)
    end
    serialized
  end

  def format_review(review)
    attribute = {
        comment: review.comment,
        rating: review.rating,
    }
    attribute
  end
end