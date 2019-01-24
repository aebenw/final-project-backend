module Api
  module V1


    class FeedsController < ApplicationController

      def show
        res = Hash.new
        feed = FeedSerializer.new(User.find(params[:id]).feed).activities
        if feed.length >= 10
          initial_feed = feed.slice!(-10..-1)
          res["initial"] = initial_feed
        end

        res["feed"] = feed
        puts res
        render json: res
      end

    private

    def feed_params
      params.require(:feed).permit(:user_id)
    end


    end


  end
end
