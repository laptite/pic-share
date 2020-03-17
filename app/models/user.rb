class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pics, dependent: :destroy
  has_many :likes

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150", tiny: "50x50" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  before_create :generate_handle

  def generate_handle
  	self.handle = self.email.downcase.split("@")[0]
  end

  def liked_pic?(pic)
byebug
    return false unless self.likes.present?
    self.likes.all? {|like| pic.likes.include?(like)}
  end

  def liked_pic(pic)
    self.likes.detect {|like| like.likeable == pic }
  end
end
