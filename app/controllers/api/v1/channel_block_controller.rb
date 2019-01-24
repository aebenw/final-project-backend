module Api
  module V1
    class ChannelBlockController < ApplicationController

      def create
        channelblock = ChannelBlock.new(channel_block_params)
        if channelblock.save
          res = channelblock.channel
          render json: res
        else render json: {errors: c.errors, params: channel_block_params}
        end

      end

      private

      def channel_block_params
        params.require(:channel_block).permit(:block_id, :channel_id)
      end

    end
  end
end
