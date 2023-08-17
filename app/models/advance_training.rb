class AdvanceTraining < ApplicationRecord
  before_validation :strip_phone_number

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :comments, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  def strip_phone_number
      self.phone = phone.to_s.gsub(/[-() ]/, "")
  end
end
