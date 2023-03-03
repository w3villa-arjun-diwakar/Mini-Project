class CreateSms < ActiveRecord::Migration[6.1]
  def change
    create_table :sms do |t|
      t.string :contact_number
      t.integer :otp
      t.timestamps
    end
  end
end
