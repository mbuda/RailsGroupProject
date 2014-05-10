class User < ActiveRecord::Base
  has_many :reviews

  validates :nickname, presence: true, uniqueness: true
  validates :password, presence: true
  validates :description, presence: true

end
