module Api
  module V1
    class AuthController < ApplicationController

      def create
        @user = User.find_by(email: user_params[:email])
        if @user && @user.authenticate(user_params[:password]) ##
          serialized_data = ActiveModelSerializers::Adapter::Json.new(
            UserSerializer.new(@user)
          ).serializable_hash
          @user.reset_feed
          token = encode({jwt: @user.id})
            render json: {jwt: token, user: serialized_data}
        else
          render json: {error: "Username or password is invalid"}, status: 401
        end
      end

      def show
        token = request.headers["Authorization"]
        decoded_token = decode(token)[0]["jwt"]
        user = User.find_by(id: decoded_token)
        if user
          user.reset_feed
          render json: user
        else
          render json: {error: 'Invalid token'}, status: 401
        end
      end

      private

      def user_params
        params.require(:auth).require(:user).permit(:email, :password)
      end

    end
  end
end
