class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :comments

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  def game_title
    game.title unless game.nil?
  end

  def title_capital
    title.capitalize unless title.nil?
  end

  def full_description
    description.split.join(' ') unless description.nil?
  end

  def min_description
    description.split[0..15].join(' ') unless description.nil?
  end

  def nick
    user.nickname unless user.nil?
  end
end
