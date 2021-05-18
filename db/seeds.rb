require "faker"

User.destroy_all
Event.destroy_all
Attendance.destroy_all

1.times do
  User.create!(
    email: Faker::Internet.email,
    password: "tututu",
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    first_name: "anonymous",
    last_name: Faker::Name.last_name,
    )
end

40.times do
  f_name = Faker::Name.first_name
  l_name = Faker::Name.last_name
  u = User.create(
    first_name: f_name, 
    last_name: l_name, 
    email: "#{f_name.downcase}.#{l_name.downcase}@yopmail.com",
    password: "tututu",
  )
end

40.times do
  Event.create!(
    start_date: Faker::Date.between(from: '2021-03-23', to: '2021-12-25'),
    duration: rand(2..15) * 5,
    title: Faker::Lorem.question(word_count: 8),
    description: Faker::Lorem.question(word_count: 25),
    price: rand(1...1000),
    location: Faker::Address.full_address,
    organiser: User.all.sample,
  )
end

80.times do
  Attendance.create!(
    stripe_customer_id: Faker::Lorem.characters(number: rand(20..42)),
    event_id: Event.all.sample.id, 
    user_id: User.all.sample.id,
  )
end

