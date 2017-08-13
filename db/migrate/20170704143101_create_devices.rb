class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :account_id
      t.string :endpoint
      t.string :p256dh
      t.string :auth

      t.timestamps null: false
    end
  end
end
