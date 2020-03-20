class Like < ApplicationRecord
	belongs_to :likeable, polymorphic: true
	belongs_to :user

	scope	:liked,    -> { where(flag: true) }
	scope	:unliked,  -> { where(flag: false) }
end
