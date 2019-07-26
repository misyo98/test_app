FactoryBot.define do
  factory :car do
    model { Faker::Name.name }
    color { Faker::Color.color_name }
    destination { Faker::Address.city}
  end
end