# Calculate and return site-wide ratings for an entity.
class SiteRatingsController < ApplicationController
  # GET /ratings/site
  def show
    entity_type = params.require(:entity_type)
    entity_id = params.require(:entity_id)

    quality_values =
      Rating
        .where(entity_type: entity_type, entity_id: entity_id, type: :quality)
        .pluck(:value)
    quality_rating = rating_str(quality_values)
    quality_rating_count = quality_values.length

    difficulty_values =
      Rating
        .where(entity_type: entity_type, entity_id: entity_id, type: :difficulty)
        .pluck(:value)
    difficulty_rating = rating_str(difficulty_values)
    difficulty_rating_count = difficulty_values.length

    render json: {
      site_entity_ratings: {
        entity_type: entity_type,
        entity_id: entity_id,
        quality_rating: quality_rating,
        quality_rating_count: quality_rating_count,
        difficulty_rating: difficulty_rating,
        difficulty_rating_count: difficulty_rating_count,
      },
    }
  end

  private

  def rating_str(values)
    return nil if values.empty?

    mean = values.sum / values.length
    format("%0.2f", mean)
  end
end
