Order.destroy_all

10.times do |index|
  Order.create!(
    sender_name: Faker::TvShows::Friends.character,
    recipient_name: Faker::TvShows::Friends.character,
    flowers: Flower.name,
    delivery_address: Faker::Address.street_address,
  )
end

p "Created #{Order.count} orders"