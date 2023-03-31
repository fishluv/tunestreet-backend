# CRUD operations for a single rating belonging to the current user.
class RatingsController < ApplicationController
  # GET /ratings
  def show
    entity_type = params.require(:entity_type)
    entity_id = params.require(:entity_id)

    quality_rating = Rating.find_by(entity_type: entity_type, entity_id: entity_id, type: :quality)

    render json: {
      ratings: {
        quality: quality_rating,
      },
    }
  end

  # PUT /ratings
  def upsert
    entity_type = params.require(:entity_type)
    entity_id = params.require(:entity_id)
    type = params.require(:type)
    value = params.require(:value)

    rating = Rating.find_by(entity_type: entity_type, entity_id: entity_id, type: type)
    if rating
      rating.update!(value: value)
      status = :ok
    else
      rating = Rating.create!(entity_type: entity_type, entity_id: entity_id, type: type, value: value)
      status = :created
    end

    render json: { rating: rating }, status: status
  end

  # DELETE /ratings
  def destroy
    entity_type = params.require(:entity_type)
    entity_id = params.require(:entity_id)
    type = params.require(:type)

    Rating.destroy_by(entity_type: entity_type, entity_id: entity_id, type: type)

    render json: { message: "Rating deleted" }
  end
end
