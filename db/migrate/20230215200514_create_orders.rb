class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :sender_name
      t.string :recipient_name
      t.string :delivery_address
      t.string :flowers
      t.string :state

      t.timestamps
    end
  end
end
