class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :window

  validates :body, presence: true
end
