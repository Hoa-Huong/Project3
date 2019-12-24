class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }

  has_many :demands, dependent: :destroy
  has_many :teach_offers, dependent: :restrict_with_exception

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { maximum: 50 }, presence: true
  validates :birth, presence: true
  validates :address, length: { maximum: 200 }, presence: true
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }
  validates :phone, presence: true
  validates :level, length: { maximum: 200 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  enum role: {user: 1, admin:2}

  has_secure_password

  class << self
# Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
# Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
