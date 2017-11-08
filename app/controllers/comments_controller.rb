class CommentsController < ApplicationController	
	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user if current_user
		@success = @comment.save ? true : false		
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :commentable_id, :commentable_type, :user_id)
	end
end
