class Pic < ApplicationRecord
	belongs_to :user
	has_many :likes, as: :likeable
  has_many :comments, dependent: :destroy

	has_attached_file :image, styles: { medium: "350x350#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	def liked?(like)
    return false unless self.likes.present?
    self.likes.include?(like)
  end

  def liked(pic)
    self.likes.detect {|like| like.likeable == pic }
  end
end
