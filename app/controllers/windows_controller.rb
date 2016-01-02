class WindowsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show, :home]
	
	def new
		@window = current_user.windows.build	
	end

	def show
		@window = Window.find(params[:id])
		@comment = @window.comments.build if signed_in?
	end

	def index
		@windows = Window.all.order(created_at: :desc)
	end

	def create
		@window = current_user.windows.build(window_params)
		if @window.save
			flash[:success] = "New window created."
			redirect_to @window
		else
			render 'new'
		end
	end

	def edit
		@window = Window.find(params[:id])
		if current_user != @window.user
			redirect_to windows_path
			flash[:danger] = "You are not authorized to edit that window."
		else
			@window = Window.find(params[:id])
		end
	end

	def update
		@window = Window.find(params[:id])
		if @window.update_attributes(window_params)
			flash[:success] = "Updated window successfully."
			redirect_to @window
		else
			render 'edit'
		end
	end

	def destroy
		Window.find(params[:id]).destroy
		flash[:success] = "Window deleted"
		redirect_to windows_path
	end

	def user_windows
		@windows = current_user.windows.all
	end

	def upvote
		@window = Window.find(params[:id])
		@window.liked_by current_user
		redirect_to @window
	end

	def downvote
		@window = Window.find(params[:id])
		@window.downvote_from current_user
		redirect_to @window
	end

	private

	def window_params
		params.require(:window).permit(:store_name, :location, :image)
	end
end
