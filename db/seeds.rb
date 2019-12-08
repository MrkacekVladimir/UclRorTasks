# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seedUser = User.create! username: 'Testing User', email: 'test@unicorncollege.com', password: 'testtest', password_confirmation: 'testtest'

for c in 1..20  do
  Category.create! title: "Seed category #{c.to_s}", color: "#000000", user: seedUser
end

for t in 1..50 do
  Tag.create! title: "Seed tag #{t.to_s}", color: "#000000", user: seedUser
end

is_done = false
for task in 1..400 do
  is_done = !is_done

  Task.create! title: "Seed task #{task.to_s}", color: "#000000", note: "Seed note number #{task.to_s}", is_done: is_done, user: seedUser
end