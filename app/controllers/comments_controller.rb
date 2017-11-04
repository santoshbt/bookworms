class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@success = @comment.save ? true : false		
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :commentable_id, :commentable_type)
	end
end
