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

	end

	def update
		
	end

	def destroy
		
	end

	private

	def window_params
		params.rquire(:window).permit(:store_name, :location)
	end
end
