class Game < ActiveRecord::Base

  has_many :reviews

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :release_date, presence: true
  validates :requirements, presence: true
  validates :genre, presence: true
  validates :PEGI, presence: true
  validates :producent, presence: true

  def title_capital
    	title.capitalize unless title.nil?
  end

  def full_description
    	description.split.join(' ') unless description.nil?
  end

  def min_description
    	description.split[0..15].join(' ') unless description.nil?
  end

  def game_title
    	game.title unless title.nil?
  end

  def rel_date
    	game.release_date unless release_date.nil? 
  end

  def req
    	game.requirements unless requirements.nil?
  end

  def game_genre
	geme.genre unless genre.nil?
  end

  def game_PEGI
	game.PEGI unless PEGI.nil?
  end

  def game_producent
	game.producent unless producent.nil?
  end

end
