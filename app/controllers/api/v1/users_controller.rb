module Api
  module V1
    class UsersController < ApplicationController

      def index
        @users = User.all
        render json: @users
      end

      def show
        user = User.find(params[:id])
        render json: user
      end

      def update
        user = User.find(user_params[:id])
        user.update(name: user_params[:name], description: user_params[:description])
        if user_params[:profile]
          blob = ActiveStorage::Blob.find_by(filename: user_params[:profile])
          user.profile.attach(blob)
        end
        user.save
        render json: user
      end


      def create
        user = User.new(user_params)
        if user.save
          serialized_data = ActiveModelSerializers::Adapter::Json.new(
            UserSerializer.new(user)
          ).serializable_hash
          token = encode({jwt: user.id})
          render json: {jwt: token, user: serialized_data}
        else
          render json: {error: user.errors}
        end
      end


      private

      def user_params
        params.require(:user).permit(:email, :password, :name, :profile, :description, :id)
      end


    end
  end
end
