class RatingViewObject

  def initialize(restroom)
    @restroom = restroom 
  end

  def display_top_five_comments
    if !(@restroom.reviews.empty?)
      @restroom.reviews.last(5).map do |review|
        review.comment
      end
    else
      ["Be the first to review this restroom!"]
    end
  end

end