class QuizResult < ApplicationRecord
  validates :previous_training, presence: true, unless: -> { previous_training.blank? }
  validates :phone, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
end
