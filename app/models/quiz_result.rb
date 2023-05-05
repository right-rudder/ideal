class QuizResult < ApplicationRecord
  #validates :previous_training, presence: true, unless: -> { previous_training.blank? }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
end
