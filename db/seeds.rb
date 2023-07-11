# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
p "Creating base user"
User.create(first_name: "David", last_name: "Morley", dob: "1987-02-14", employment_started_at: "2018-06-04" )

p "Creating other users"
i = 10
while i < 32 do
  User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , dob: "1987-02-14", employment_started_at: "2018-07-#{i}" )
  User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , dob: "1987-07-#{i}", employment_started_at: "2018-06-04" )
  i += 1
end

p "Created Users"