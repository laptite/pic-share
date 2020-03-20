class Comment < ApplicationRecord
  belongs_to :pic
  validates :body, presence: true
end
