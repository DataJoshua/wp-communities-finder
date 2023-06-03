# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = [  'Hobbies and interests',  'Social and support groups',  'Professional and business networks',  'Cultural and language groups',  'Political and social activism',  'Fun and entertainment',  'Travel and adventure',  'Education and learning',  'Health and wellness',  'Art and creativity',  'Personal development',  'Technology and gaming',  'Food and cooking',  'Pets and animals',  'Fashion and beauty',  'Relationships and dating']

categories.each do |name|
  Category.create(name: name)
end

emails = %w[admin-test-lol@gmail.com]

emails.each do |mail|
  FactoryBot.create(:user, email: mail)
end
