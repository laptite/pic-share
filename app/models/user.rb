class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  has_many :pics, dependent: :destroy
  has_one_attached :avatar
  # { tiny: "50x50#" }

  before_create :generate_handle

  def generate_handle
  	self.handle = self.email.downcase.split("@")[0]
  end

  def liked_pic?(pic)
    return false unless self.likes.present?
    self.likes.all? {|like| pic.likes.include?(like)}
  end

  def liked_pic(pic)
    self.likes.detect {|like| like.likeable == pic }
  end

  def resize_avatar(pixel)
    options = { 
      coalesce: true,
      thumbnail: "#{pixel}x#{pixel}^", 
      gravity: 'center', 
      extent: "#{pixel}x#{pixel}"
    }
    processed = self.avatar.variant(
      loader: { page: nil }, 
      combine_options: options
    ).processed
    return processed
  end
end
