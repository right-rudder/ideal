class Message < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  validates :body, presence: true
  validates :email, presence: true
end
