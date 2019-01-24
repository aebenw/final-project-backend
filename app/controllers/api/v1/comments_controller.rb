module Api
  module V1
      class CommentsController < ApplicationController
        def create
          comment = Comment.new(comment_params)
          if comment.save
            render json: comment
          end
        end

        private

        def comment_params
          params.require(:comment).permit(:content, :user_id, :block_id)
        end
      end
  end
end
