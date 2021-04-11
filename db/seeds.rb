# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 50.times do |i|
#   User.create!(login: "Animalover#{Time.now.to_i + i}",
#                        name: "Ilon#{Time.now.to_i + i}",
#                        phone1: rand(10**10).to_s,
#                        phone2: rand(10**10).to_s,
#                        password: "password",
#                        email: "email#{Time.now.to_i + i}@email.com")
# end
# 50.times do |i|
# animal = Animal.create!(name: "Murzik #{i+1}",
# 												breed: 'cat',
#                         sex: 'female',
#                         color: 'ginger',
#                         features: 'Loudly',
#                         age: 3.5,
#                         complex_vaccination: true,
#                         rabies_vaccination: true,
#                         sterilization: false,
#                         animal_has_family: false,
#                         responsible_person: 'smb',
#                         show_in_gallery: false,
#                         edited_by: 'admin')
# end
def admin_create
  AdminUser.create_with(email: 'admin@example.com',
                        password: 'password',
                        password_confirmation: 'password').find_or_create_by(email: 'admin@example.com')
end

admin_create unless Rails.env.production?

%w[peasant animal_manager request_manager manager admin].each do |role|
  Role.find_or_create_by(name: role)
end
