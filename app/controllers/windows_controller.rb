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
		@window = Window.new(window_params)
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
		
	end

	def destroy
	end

	private

	def window_params
		params.require(:window).permit(:store_name, :location, :image)
	end
end
