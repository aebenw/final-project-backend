module Api
  module V1

    class ChannelsController < ApplicationController

      def index
        channels = Channel.all
        render json: channels
      end

      def show

        channel = Channel.find(params[:id])
        render json: channel
      end

      def create
        channel = Channel.new(name: channel_params[:name])
        if channel.save
          user = User.find(channel_params[:user_id])
          channel.users.push(user)
          render json: channel
        end
      end

      private

      def channel_params
        params.require(:channel).permit(:name, :user_id)
      end

    end




  end
end
