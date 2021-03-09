# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.create!(login: "Animalover#{Time.now.to_i}",
#                      name: "Ilon#{Time.now.to_i}",
#                      phone1: rand(10**10).to_s,
#                      phone2: rand(10**10).to_s,
#                      password: "password#{Time.now.to_i}",
#                      email: "email#{Time.now.to_i}@email.com",
#                      permissions: 7)

# animal = Animal.create!(breed: 'Chau-chau',
#                         sex: 'female',
#                         color: 'ginger',
#                         features: 'Loudly',
#                         img_url: 'https://i.pinimg.com/originals/a4/89/92/a4899299a5061e4b24061840c8111b92.jpg',
#                         age: 1.5,
#                         complex_vaccination: true,
#                         rabies_vaccination: true,
#                         sterilization: false,
#                         animal_has_family: false,
#                         responsible_person: 'none')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
