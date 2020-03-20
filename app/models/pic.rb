require "image_processing/mini_magick"

class Pic < ApplicationRecord
  include Rails.application.routes.url_helpers

	belongs_to :user
	has_many :likes, as: :likeable
  has_many :comments, dependent: :destroy

  has_one_attached :image
  # styles: { medium: "350x350#" }

	def liked?(like)
    return false unless self.likes.present?
    self.likes.include?(like)
  end

  def liked(pic)
    self.likes.detect {|like| like.likeable == pic }
  end

  def resize_image(pixel)
    options = {
      coalesce: true,
      thumbnail: "#{pixel}x#{pixel}^", 
      gravity: 'center', 
      extent: "#{pixel}x#{pixel}"
    }
    processed = self.image.variant(
      loader: { page: nil }, 
      combine_options: options
    ).processed
    return processed
  end
end
