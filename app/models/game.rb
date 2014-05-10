class Game < ActiveRecord::Base

  has_many :reviews

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :release_date, presence: true
  validates :requirements, presence: true
  validates :genre, presence: true
  validates :PEGI, presence: true
  validates :producent, presence: true

end
