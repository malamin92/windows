class Window < ActiveRecord::Base
	validates :store_name, presence: true, length: {maximum: 80}
	validates :location, presence: true, length: {maximum: 80}
	validates :image, presence: true

	has_attached_file :image, styles: { large: "600x600", medium: "300x300#", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
