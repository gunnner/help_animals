class User < ApplicationRecord
  authenticates_with_sorcery!
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :login, uniqueness: true, presence: true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL }, presence: true
  validates :password, length: { minimum: 8 }, presence: true

  enum permissions: %i[can_add_and_remove_users
                       can_edit_users
                       can_add_and_remove_animals
                       can_see_users_details
                       can_edit_animals
                       can_create_animals_requests
                       can_close_animals_request
                       can_see_animals_details], _default: 'can_see_animals_details'

end
