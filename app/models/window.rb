class Window < ActiveRecord::Base
	acts_as_votable
	before_save {titleize_name}

	validates :store_name, presence: true, length: {maximum: 80}
	validates :location, presence: true, length: {maximum: 80}
	validates :image, presence: true

	has_attached_file :image, styles: { large: "600x600", medium: "300x300#", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	
	belongs_to :user
	has_many :comments, dependent: :destroy



  	def titleize_name
  		self.store_name = self.store_name.titleize
  	end
end
