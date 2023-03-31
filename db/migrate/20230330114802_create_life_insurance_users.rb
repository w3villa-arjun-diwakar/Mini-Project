class CreateLifeInsuranceUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :life_insurance_users do |t|
      t.string :name
      t.integer :age
      t.string :phone

      t.timestamps
    end
  end
end
