FactoryBot.define do
  factory :order do
    sender_name { Faker::Name.name }
    recipient_name { Faker::Name.name }
    delivery_address { Faker::Address.street_address }
    flowers { Flower.name }
    state { Order.states.keys.sample }
  end
end