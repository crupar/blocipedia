require 'faker'


50.times do
  Wiki.create!(
    title:  Faker::Lorem.word,
    body:   Faker::Lorem.paragraph(3)
  )
end
wikis = Wiki.all

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(6)
  )
end

User.create!(
  email: "admin@admin.com",
  password: "123456",
  role: "admin"
)


User.create!(
    email:      "standard@standard.com",
    password:   "helloworld",
    role:       "standard"
)

User.create!(
    email:      "premium@premium.com",
    password:   'helloworld',
    role:       'premium'
)



puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
