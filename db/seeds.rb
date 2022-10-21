10.times do |index|
  User.create(
    name: Faker::Name.unique.name,
    phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164,
    birth_date: Date.today
  )
end

Stock.create(name: 'Deposit', code: 'd01', types: :deposit, balance: 10000)
Stock.create(name: 'Withdraw', code: 'w01', types: :withdraw, balance: 10000)
