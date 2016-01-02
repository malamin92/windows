class CommentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def create
		@window = Window.find(params[:window_id])
		@comment = @window.comments.build(comment_params)
		@comment.user_id = current_user.id

		@comment.save
		redirect_to window_path(@window)
		
	end

	def destroy
		@window = Window.find(params[:window_id])
		@comment = @window.comments.find(params[:id])
		@comment.destroy
		flash[:success] = "Comment has been deleted."

		redirect_to window_path(@window)
	end

	private 

	def comment_params
		params.require(:comment).permit(:body)
	end
end
