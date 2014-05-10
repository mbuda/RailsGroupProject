class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :comments

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

end
