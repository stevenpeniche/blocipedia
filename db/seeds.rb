require 'faker'

# Create Admin User
User.create!(
	email:       'peniche1210@gmail.com',
	password:     123456,
	confirmed_at: DateTime.now,
	role:         'admin'
)

# Create Standard User
User.create!(
	email:       'standard@bfd.com',
	password:     123456,
	confirmed_at: DateTime.now,
	role:         'standard'
)

# Create Premium User
User.create!(
	email:       'premium@bfd.com',
	password:     123456,
	confirmed_at: DateTime.now,
	role:         'premium'
)

# Create Users
5.times do
	User.create!(
		email:        Faker::Internet.unique.email,
		password:     Faker::Internet.password,
		confirmed_at: DateTime.now
	)
end
users = User.all

# Create Wikis
15.times do
	Wiki.create!(
		user: 	 users.sample,
		title:   Faker::GameOfThrones.unique.character,
		body:    Faker::Lorem.unique.paragraph,
		private: Faker::Boolean.boolean
	)
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
