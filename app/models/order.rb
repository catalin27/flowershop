class Order < ApplicationRecord
  # include ActiveModel::Serialization

  enum :state, [:pending, :delivered], default: :pending

  validates :sender_name, presence: true
  validates :recipient_name, presence: true
  validates :delivery_address, presence: true
  validates :flowers, inclusion: {in: Flower::FLOWER_NAMES, message: "is not included in the list: #{Flower::FLOWER_NAMES.join(', ')}"}
  validates :state, inclusion: { in: states.keys }
end
