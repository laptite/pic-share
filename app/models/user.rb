class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pics, dependent: :destroy

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150", tiny: "50x50" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  before_create :generate_handle

  def generate_handle
  	self.handle = self.email.downcase.split("@")[0]
  end
end
