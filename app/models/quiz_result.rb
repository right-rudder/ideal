class QuizResult < ApplicationRecord
  validates :previous_training, presence: true, unless: -> { previous_training.blank? }
end
