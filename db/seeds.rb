# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  User.create!(
    [
    { name: 'admin1', email: 'admin1@gmail.com', password: 'password', password_confirmation: 'password', admin: true },
    { name: 'admin2', email: 'admin2@gmail.com', password: 'password', password_confirmation: 'password', admin: true },
    { name: 'user1', email: 'user1@gmail.com', password: 'password', password_confirmation: 'password', admin: false },
    { name: 'user2', email: 'user2@gmail.com', password: 'password', password_confirmation: 'password', admin: false },
    { name: 'user3', email: 'user3@gmail.com', password: 'password', password_confirmation: 'password', admin: false },
    { name: 'user4', email: 'user4@gmail.com', password: 'password', password_confirmation: 'password', admin: false },
    { name: 'user5', email: 'user5@gmail.com', password: 'password', password_confirmation: 'password', admin: false },
    { name: 'user6', email: 'user6@gmail.com', password: 'password', password_confirmation: 'password', admin: false },
    { name: 'user7', email: 'user7@gmail.com', password: 'password', password_confirmation: 'password', admin: false },
    { name: 'user8', email: 'user8@gmail.com', password: 'password', password_confirmation: 'password', admin: false }
    ]
  )
  20.times do |n|
    title = Faker::Games::Pokemon.name
    content = Faker::Games::Pokemon.location
    deadline = Faker::Date.between(from: Date.tomorrow, to: 30.days.since)
    status = ["0","1","2"]
    priority = ["1","2","3"]
    Task.create!(title: title,
                content: content,
                deadline: deadline,
                status: rand(0..2),
                priority: rand(1..3),
                user_id: rand(3..7))
  end

  Label.create!(
    [
      {labelname: 'アメシスト'},
      {labelname: 'コハク'},
      {labelname: 'エメラルド'},
      {labelname: 'オパール'},
      {labelname: 'ガーネット'},
      {labelname: 'キャッツアイ'},
      {labelname: 'サファイア'},
      {labelname: 'ダイヤモンド'},
      {labelname: 'トパーズ'},
      {labelname: 'パール'},
      {labelname: 'ルビー'},
      {labelname: 'パール'},
      {labelname: 'サンゴ'}
    ]
  )