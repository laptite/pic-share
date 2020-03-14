class Pic < ApplicationRecord
	validates :title, :description, presence: true
end
