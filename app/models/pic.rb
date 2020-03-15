class Pic < ApplicationRecord
	belongs_to :user
	validates :title, :description, presence: true

	has_attached_file :image, styles: { medium: "350>x350" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
