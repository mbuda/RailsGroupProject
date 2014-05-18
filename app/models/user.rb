class User < ActiveRecord::Base
  has_many :reviews
  has_many :comments

  validates :nickname, presence: true, uniqueness: true
  validates :password, presence: true
  validates :description, presence: true

end
