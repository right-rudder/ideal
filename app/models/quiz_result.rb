class QuizResult < ApplicationRecord
  #validates :previous_training, presence: true, unless: -> { previous_training.blank? }
  before_validation :strip_phone_number
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, length: { minimum: 7 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  def strip_phone_number
    self.phone = phone.to_s.gsub(/[-() ]/, "")
  end
end
