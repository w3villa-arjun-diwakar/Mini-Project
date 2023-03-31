class AddGenderToLifeInsuranceUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :life_insurance_users, :gender, :string
  end
end
