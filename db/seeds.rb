# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

user_list = [
	{
		name: 'Captain Obvious',
		email: 'john@test.com',
		password: 'test1010',
		avatar_url: 'https://user-images.githubusercontent.com/4002284/77017229-2306fe00-6937-11ea-8fb4-958dbd8e039a.jpg',
		bio: 'Selvage vice cray, activated charcoal schlitz sriracha hoodie godard umami locavore deep v. Marfa pug slow-carb, seitan copper mug wayfarers tofu art party snackwave pok pok.'
	},
	{
		name: 'Miss Happy',
		email: 'jane@test.com',
		password: 'test1010',
		avatar_url: 'https://user-images.githubusercontent.com/4002284/77017265-3619ce00-6937-11ea-9e9c-33fc2f4f1e85.gif',
		bio: 'Skateboard lo-fi cray seitan, sriracha humblebrag four loko bespoke tumeric venmo ugh vice pitchfork tbh live-edge. Ethical semiotics humblebrag sustainable art party.'
	}
]

user_list.each do |user|
	@user = User.create(
		email: user[:email],
		password: user[:password], 
		password_confirmation: user[:password],
		bio: user[:bio]
	)
end

# For console testing:
# user = { name: 'Captain Obvious', email: 'cap@test.com', password: 'test1010', avatar_url: 'https://user-images.githubusercontent.com/4002284/77017229-2306fe00-6937-11ea-8fb4-958dbd8e039a.jpg', bio: 'Selvage vice cray, activated charcoal schlitz sriracha hoodie godard umami locavore deep v. Marfa pug slow-carb, seitan copper mug wayfarers tofu art party snackwave pok pok.'}
# User.create(email: user[:email],password: user[:password], password_confirmation: user[:password],bio: user[:bio])
# file = open(user[:avatar_url])
# filename = user[:avatar_url].split('/').last
# @user = User.last'


# User.all.each_with_index do |user, idx|
# 	file = open(user_list[idx][:avatar_url]) 
# 	filename = user_list[idx][:avatar_url].split('/').last
# 	processed = ImageProcessing::MiniMagick.source(file).resize_to_limit(50, 50).call
# 	user.avatar.attach(io: processed, filename: filename, content_type: file.content_type, identify: false)
# 	# this fails on attach with  undefined method 'build_after_unfurling' (an ActiveStorage::Blob method)
# 	# presumably attach can't be called since blob is not beting created
#.  # Can create a blob but haven't figured out how to get it attached
#.  # ActiveStorage::Blob.create_and_upload!(io: file, filename: filename, content_type: file.content_type, metadata: nil, identify: true, record: @user)
# end

