class User < ActiveRecord::Base

  validates :nickname, presence: true, uniqueness: true
  validates :password, presence: true
  validates :description, presence: true

end
