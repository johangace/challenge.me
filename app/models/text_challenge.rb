class TextChallenge < ApplicationRecord
  validates :body, presence: true, length: { in: 1..200}
end
