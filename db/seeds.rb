# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user
user_attributes = [
  { name: "Hafez Busra", password: "abcd1234", password_confirmation: "abcd1234", email: "hafez@mail.com"},
  { name: "Jerome Ng", password: "abcd1234", password_confirmation: "abcd1234", email: "jerome@mail.com"},
  { name: "Kevin", password: "abcd1234", password_confirmation: "abcd1234", email: "kevin@mail.com"},
  { name: "Yfsin Tazky", password: "abcd1234", password_confirmation: "abcd1234", email: "tazky@mail.com"},
  { name: "Tasnim", password: "abcd1234", password_confirmation: "abcd1234", email: "tasnim@mail.com"}
]

user_attributes.each do |attributes|
  if User.where(:email => attributes[:email]).blank?
    User.create(attributes)
  end
end