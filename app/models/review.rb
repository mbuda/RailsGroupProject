class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

end
