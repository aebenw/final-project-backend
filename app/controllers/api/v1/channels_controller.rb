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

      def channel_follower
        ChannelFollower.create(channel_id: channel_params[:id], follower_id: channel_params[:user_id])
        user = ShallowUserSerializer.new(User.find(channel_params[:user_id]))
        channel = ShallowChannelSerializer.new(Channel.find(channel_params[:id]))
        render json: {user: user, channel: channel}
      end

      def channel_unfollower
        channel_follower = ChannelFollower.find_by(channel_id: channel_params[:id], follower_id: channel_params[:user_id])
        user = ShallowUserSerializer.new(cf.follower)
        channel = ShallowChannelSerializer.new(cf.channel)

        channel_follower.destroy
        render json: {user: user, channel: channel}

      end

    def destroy
      channel = Channel.find(params[:id])
      channel.destroy
      render json: {message: "deleted"}
    end

      private

      def channel_params
        params.require(:channel).permit(:name, :user_id, :id)
      end

    end
  end
end
