# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate a bunch of additional users.
10.times do |n|
  name = "list named->#{n + 1}"
  description = "this lists  has this content list-#{n + 1}"
  List.create!(name: name,
               description: description)
end

# Generate microposts for a subset of users.
lists = List.order(:created_at).take(10)
10.times do
  content = "this this has the number -#{n + 1}"
  lists.each { |l| l.tasks.create!(content: content) }
end
