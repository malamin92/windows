class Window < ActiveRecord::Base
	validates :store_name, presence: true, length: {maximum: 80}
	validates :location, presence: true, length: {maximum: 80}
end
