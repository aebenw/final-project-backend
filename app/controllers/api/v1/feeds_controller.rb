module Api
  module V1


    class FeedsController < ApplicationController

      def show
        res = Hash.new
        user_feed = User.find(params[:id]).feed
        # byebug
        if user_feed.activities.length > 0

          feed = FeedSerializer.new(user_feed).activities
          res["feed"] = feed
        else
          res["noMoreContent"] = "No more unseend friend activity! Add more friends to see more content."
        end
          render json: res
      end

    private

    def feed_params
      params.require(:feed).permit(:user_id)
    end


    end


  end
end
