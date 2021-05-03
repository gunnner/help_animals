class User < ApplicationRecord
  has_secure_password
  rolify
  has_many :requests, dependent: :destroy
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  after_create :assign_default_role

  accepts_nested_attributes_for :roles

  validates :login, uniqueness: true, presence: true, length: { maximum: 40 }
  validates :email, uniqueness: true, format: { with: VALID_EMAIL }, presence: true, length: { maximum: 254 }
  validates :password, length: { minimum: 8 }, presence: true, on: :create
  validates :name, presence: true, length: { in: 2..100 }
  validates :phone1, length: { maximum: 25 }
  validates :phone2, length: { maximum: 25 }

  def assign_default_role
    add_role(:admin) if roles.blank?
  end

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end
end
