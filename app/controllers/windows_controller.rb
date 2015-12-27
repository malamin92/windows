class WindowsController < ApplicationController
	before_action :authenticate_user!	
	
	def new
		@window = Window.new	
	end

	def show
		@window = Window.find(params[:id])
	end

	def index
		@windows = Window.all
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
	
	def home	
	end

	def user_windows
		@windows = current_user.windows.all
	end

	private

	def window_params
		params.require(:window).permit(:store_name, :location, :image)
	end
end
