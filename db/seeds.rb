# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "example User",
            email: "example@qq.com",
            password: "123456",
            password_confirmation: "123456",
            admin: true
            )

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@qq.com"
  password = "123456"
  User.create!(name: name,
            email: email,
            password: password,
            password_confirmation: password
            )
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# 关系数据

users2 = User.all
user = users2.first
following = users2[2..50]
followers = users2[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }




