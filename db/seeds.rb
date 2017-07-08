# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Admin", surname: "Adminych", email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
User.create!(name: "User", surname: "Userych", email: 'user@example.com', password: 'password', password_confirmation: 'password', admin: false, user: true)

fixtures_path = Rails.root.join('app', 'assets', 'images')

categories_arr = ["Драма", "Ужас", "Приключение"]

categories_arr.each do |i|
  Category.create(title: i)
end

8.times do |n|
  name  = Faker::Name.name
  password = Faker::Internet.password
  email = Faker::Internet.email
  User.create!(name:  name, password: password, email: email)
end


3.times do |n|
  name  = Faker::Name.first_name
  surname = Faker::Name.last_name 
  Author.create!(name:  name, surname: surname)
end

1.upto 10 do |n|
  book = Book.new(title: Faker::Lorem.sentence(2), description: Faker::Lorem.sentence(3), user_id: n, file: File.new(fixtures_path.join(n.to_s + ".jpg")))
  book.authors << Author.take
  book.categories << Category.take
  book.save
end

# categories = Category.all

# categories.each do |category|
#   Theme.create!(category: category, book: Book.take)
# end


# authors = Author.all

# authors.each do |author|
#   Authorship.create!(author: author, book: Book.take)
# end








