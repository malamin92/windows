class WindowsController < ApplicationController
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
		if @window.save
			flash[:success] = "Update window successfully."
		else
			render 'edit'
		end
	end

	def destroy
	end
	
	def home	
	end

	private

	def window_params
		params.require(:window).permit(:store_name, :location, :image)
	end
end
