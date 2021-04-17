class Request < ApplicationRecord
  belongs_to :user

  validates :address, length: { maximum: 500 }, presence: true
end
