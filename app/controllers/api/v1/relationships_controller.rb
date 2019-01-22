module Api
module V1

class RelationshipsController < ApplicationController
  def create
    Relationship.create(relationship_params)
    user = User.find(relationship_params[:followed_id])
    render json: user
  end

  def destroy
    user_one = User.find(relationship_params[:follower_id])
    user_two = User.find(relationship_params[:followed_id])

    # Checking to the current user's active and passive relationships
    # Checking for the other user's id
    # Whereever that lives is their relationship
    active = user_one.active_relationships.find {|follower| follower.followed_id == user_two.id}
    passive = user_one.passive_relationships.find {|follower| follower.follower_id == user_two.id}

    # If its in the active
    if active
      active.destroy
    # If its in the passive
    elsif passive
      passive.destroy
    end
    render json: {message: "relationship destroyed"}
  end

  private
  def relationship_params
    params.require(:relationship).permit(:follower_id, :followed_id)
  end

end


end
end
