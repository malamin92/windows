class WindowsController < ApplicationController
	def index
		@windows = Window.all
	end
end
