class CommentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def create
		@window = Window.find(params[:window_id])
		@comment = @window.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comments = @window.comments

		if @comment.save
			respond_to do |format|
				format.html { redirect_to post_path(@post) }
       			format.js 
       		end
		end
	end


	def destroy
		@window = Window.find(params[:window_id])
		@comment = @window.comments.find(params[:id])
		@comment.destroy
		@comments = @window.comments

		respond_to do |format|
			format.html do
				flash[:success] = "Comment has been deleted."
				redirect_to window_path(@window) 
			end
			format.js
		end
	end

	private 

	def comment_params
		params.require(:comment).permit(:body)
	end
end