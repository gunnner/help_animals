class Request < ApplicationRecord
  belongs_to :user

  validates :address, length: { minimum: 10 }, presence: true
end
