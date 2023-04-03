# CRUD operations for a single rating belonging to the current user.
class RatingsController < ApplicationController
  before_action :require_login

  # GET /ratings
  def show
    entity_type = params.require(:entity_type)
    entity_id = params.require(:entity_id)

    my_ratings = current_user.ratings.where(
      entity_type: entity_type,
      entity_id: entity_id,
    )
    quality_rating = my_ratings.find_by(type: :quality)
    difficulty_rating = my_ratings.find_by(type: :difficulty)

    render json: {
      user_entity_ratings: {
        user_id: current_user.id,
        entity_type: entity_type,
        entity_id: entity_id,
        quality_rating: quality_rating&.val,
        difficulty_rating: difficulty_rating&.val,
      },
    }
  end

  # PUT /ratings
  def upsert
    entity_type = params.require(:entity_type)
    entity_id = params.require(:entity_id)
    type = params.require(:type)
    value = params.require(:value)

    rating = current_user.ratings.find_by(
      entity_type: entity_type,
      entity_id: entity_id,
      type: type,
    )
    if rating
      rating.update!(value: value)
    else
      rating = current_user.ratings.create!(
        entity_type: entity_type,
        entity_id: entity_id,
        type: type,
        value: value
      )
    end

    render json: {
      user_entity_rating: {
        user_id: current_user.id,
        entity_type: entity_type,
        entity_id: entity_id,
        type: type,
        value: value,
      }
    }
  end

  # DELETE /ratings
  def destroy
    entity_type = params.require(:entity_type)
    entity_id = params.require(:entity_id)
    type = params.require(:type)

    current_user.ratings.destroy_by(
      entity_type: entity_type,
      entity_id: entity_id,
      type: type,
    )

    render json: { message: "Rating deleted" }
  end
end
