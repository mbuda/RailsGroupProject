class Game < ActiveRecord::Base

  has_many :reviews

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :release_date, presence: true
  validates :requirements, presence: true
  validates :genre, presence: true
  validates :pegi, presence: true
  validates :producent, presence: true
  validate :date_is_date?

  def title_capital
    	title.capitalize unless title.nil?
  end

  def full_description
    	description.split.join(' ') unless description.nil?
  end

  def min_description
    	description.split[0..15].join(' ') unless description.nil?
  end

  def rel_date
    	release_date unless release_date.nil?
  end

  def req
    	requirements unless requirements.nil?
  end

  def game_genre
	genre unless genre.nil?
  end

  def game_pegi
	pegi unless pegi.nil?
  end

  def game_producent
	producent unless producent.nil?
  end

  private
  def date_is_date?
    unless release_date.is_a?(Date)
      errors.add(:release_date, :not_a_date)
    end
  end
end
