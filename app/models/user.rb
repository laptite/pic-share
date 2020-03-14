class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pics

  before_create :generate_handle

  def generate_handle
  	self.handle = self.email.downcase.split("@")[0]
  end
end
