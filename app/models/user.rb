class User < ApplicationRecord
  rolify
  authenticates_with_sorcery!
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  after_create :assign_default_role

  accepts_nested_attributes_for :roles

  validates :login, uniqueness: true, presence: true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL }, presence: true
  validates :password, length: { minimum: 8 }, presence: true, on: :create

  def assign_default_role
    add_role(:admin) if roles.blank?
  end
end
