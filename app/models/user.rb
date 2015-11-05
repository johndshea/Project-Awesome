class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {
    minimum: 8, allow_nil: true
  }

  # has_and_belongs_to_many :teams
  # has_and_belongs_to_many :todos
  # has_many :todos, through: :teams
end
