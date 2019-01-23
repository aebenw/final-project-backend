module Api
  module V1


    class FeedsController < ApplicationController

      def show
        feed = Feed.initialize(params[:id])
        
        render json: {feed: feed}
      end

    private

    def feed_params
      params.require(:feed).permit(:user_id)
    end


    end


  end
end
