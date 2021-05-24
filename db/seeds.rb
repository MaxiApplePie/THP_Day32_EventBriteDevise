require "faker"
require 'open-uri'


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
    is_admin: false, 
    )
end

1.times do
  User.create!(
    email: "lmc@outlook.fr",
    password: "tututu",
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    first_name: "LMC",
    last_name: Faker::Name.last_name,
    is_admin: true,
    )
end

1.times do
  User.create!(
    email: "lmc@outlook.tt",
    password: "tututu",
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    first_name: "LMC",
    last_name: Faker::Name.last_name,
    is_admin: false,
    )
end

3.times do
  f_name = Faker::Name.first_name
  l_name = Faker::Name.last_name
  u = User.create(
    first_name: f_name, 
    last_name: l_name, 
    email: "#{f_name.downcase}.#{l_name.downcase}@yopmail.com",
    password: "tututu",
    description: Faker::Quotes::Shakespeare.hamlet_quote,
  )
end
arr_pictures = [
  'https://images.unsplash.com/photo-1593198586487-8fd6ae26ed9e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  'https://images.unsplash.com/photo-1493308903033-e622ac815e5d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1410&q=80',
  'https://images.unsplash.com/photo-1530103862676-de8c9debad1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
  'https://images.unsplash.com/photo-1519638498686-40ee5ff226df?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80',
  'https://images.unsplash.com/photo-1468704971477-0211e6c57317?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  'https://images.unsplash.com/photo-1609051408500-b3ef7377b799?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1349&q=80',
  'https://images.unsplash.com/photo-1510529769127-2adbcfcca438?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1348&q=80',
  'https://images.unsplash.com/photo-1565266617019-0023f689a9c2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1341&q=80',
  'https://images.unsplash.com/photo-1578575694913-17cc29bdcc14?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1489&q=80',
  'https://images.unsplash.com/photo-1557787163-1635e2efb160?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
  ]

10.times do
  file = open(arr_pictures.sample)
  e = Event.create!(
    start_date: Faker::Time.between(from: '2021-05-23', to: '2021-12-25', format: :short),
    duration: rand(2..15) * 5,
    title: Faker::Lorem.sentence(word_count: rand(3..6)),
    description: Faker::Lorem.paragraph(sentence_count: rand(3..5)),
    price: rand(40...1000),
    location: Faker::Address.full_address,
    organiser: User.all.sample,
  )
  e.img_event.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
end


20.times do
  Attendance.create!(
    stripe_customer_id: Faker::Lorem.characters(number: rand(20..42)),
    event_id: Event.all.sample.id, 
    user_id: User.all.sample.id,
  )
end

