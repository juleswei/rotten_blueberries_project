# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(
  email: "hello@gmail.com",
  password: "hello",
  password_confirmation: "hello",
  firstname: "donald",
  lastname: "duck",
  admin: true
)
user = User.create(
  email: "john@gmail.com",
  password: "hello",
  password_confirmation: "hello",
  firstname: "john",
  lastname: "doe",
  admin: false
)
user = User.create(
  email: "jane@gmail.com",
  password: "hello",
  password_confirmation: "hello",
  firstname: "jane",
  lastname: "doe",
  admin: false
)

movie = Movie.create(
  title: "Dark Night",
  director: "Christopher",
  runtime_in_minutes: "90",
  description: "cool",
  release_date: 10.days.ago
)
action = Category.create(name: 'action')

movie.categories << action


