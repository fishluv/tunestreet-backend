# CRUD operations for a single rating belonging to the current user.
class RatingsController < ApplicationController
  # GET /rating
  def show
    type = params.require(:type)
    entity_type = params.require(:entity_type)
    entity_id = params.require(:entity_id)

    rating = Rating.find_by!(type: type, entity_type: entity_type, entity_id: entity_id)

    render json: { rating: rating }
  end

  # PUT /rating
  def upsert
    type = params.require(:type)
    entity_type = params.require(:entity_type)
    entity_id = params.require(:entity_id)
    value = params.require(:value)

    rating = Rating.find_by(type: type, entity_type: entity_type, entity_id: entity_id)
    if rating
      rating.update!(value: value)
      status = :ok
    else
      rating = Rating.create!(type: type, entity_type: entity_type, entity_id: entity_id, value: value)
      status = :created
    end

    head status
  end

  # DELETE /rating
  def destroy
    type = params.require(:type)
    entity_type = params.require(:entity_type)
    entity_id = params.require(:entity_id)

    Rating.destroy_by(type: type, entity_type: entity_type, entity_id: entity_id)

    head :no_content
  end
end
