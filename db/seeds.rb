20.times do |n|
  name  = Faker::Name.name
  email = "userhs#{n+1}@gmail.com"
  password = "123456"
  address = Faker::Address.city
  phone = Faker::PhoneNumber.cell_phone
  level = "Học sinh"
  User.create!(name: name,
   birth: "12-11-1998",
   address: address,
   phone: phone,
   email: email,
   password: password,
   level: level,
   password_confirmation: password)
end
20.times do |n|
  name  = Faker::Name.name
  email = "usersv#{n+1}@gmail.com"
  password = "123456"
  address = Faker::Address.city
  phone = Faker::PhoneNumber.cell_phone
  level = "Sinh viên"
  User.create!(name: name,
   birth: "12-11-1998",
   address: address,
   phone: phone,
   email: email,
   password: password,
   level: level,
   password_confirmation: password)
end
20.times do |n|
  name  = Faker::Name.name
  email = "userndl#{n+1}@gmail.com"
  password = "123456"
  address = Faker::Address.city
  phone = Faker::PhoneNumber.cell_phone
  level = "Người đi làm"
  User.create!(name: name,
   birth: "12-11-1998",
   address: address,
   phone: phone,
   email: email,
   password: password,
   level: level,
   password_confirmation: password)
end

User.create!(name: "Admin",
 birth: "16-01-1998",
 email: "admin@gmail.com",
 address: "Hà Nội",
 phone: "0123456789",
 password: "123456",
 level: "Admin",
 password_confirmation: "123456",
 role:2)

30.times do |n|
  user_id = rand(60)
  subject  = "Toán"
  level = "Lớp #{rand(11)+1}"
  amount_student = rand(3) + 1
  time_per_session = 2
  fee = "500.000"
  address = "Minh Khai #{n}"
  note = "Có kinh nghiệm, có phương pháp và kỹ năng"
  status = 0
  status_admin = 1
  Demand.create!(user_id: user_id,
    subject: subject,
    level: level,
    address: address,
    amount_student: amount_student,
    time_per_session: time_per_session,
    fee: fee,
    note: note, status: status, status_admin: status_admin)
end
