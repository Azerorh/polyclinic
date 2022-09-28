FactoryBot.define do
  factory(:user) do
    phone_number { Faker::Base.numerify('+38(###)-###-####') }
    password { Faker::Internet.password }
  end

  factory(:doctor) do
    phone_number { Faker::Base.numerify('+38(###)-###-####') }
    password { Faker::Internet.password }
  end

  factory(:case) do
    question { Faker::String.random }
    status { true }
    association :doctor, factory: :doctor
    association :user, factory: :user
  end
end