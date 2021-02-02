# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.create([
    {username: "jorge.j", password_digest: "jorge", first_name: "Jorge", last_name: "Jorge", bio: "I am Jorge"},
    {username: "mandy.m", password_digest: "mandy", first_name: "Mandy", last_name: "Mandy", bio: "I am Mandy"},
    {username: "sally.s", password_digest: "sally", first_name: "Sally", last_name: "Sally", bio: "I am Sally"},
    {username: "walter.w", password_digest: "walter", first_name: "Walter", last_name: "Walter", bio: "I am Walter"},
])

