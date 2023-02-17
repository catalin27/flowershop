require "rails_helper"

RSpec.describe Order do
  error_messages = [
    "Sender name can't be blank",
    "Recipient name can't be blank",
    "Delivery address can't be blank",
    "Flowers is not included in the list: #{Flower::FLOWER_NAMES.join(', ')}"
  ]

  context "verify validations" do
    it "yields errors for empty model" do
      order = Order.create
      expect(order.valid?).to eq false
      expect(order.errors.full_messages).to eq error_messages
      expect(Order.count).to eq 0
    end

    it "yields error if flower is not allowed" do
      order = build(:order, flowers: 'unallowed')

      expect{ order.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: #{error_messages.last}")
      expect(Order.count).to eq 0
    end

    it "creates a record when Order is valid" do
      create(:order)
      expect(Order.count).to eq 1
    end
  end
end