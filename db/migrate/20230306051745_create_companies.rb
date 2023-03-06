class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :plan_info
      t.string :cover
      t.string :premium

      t.timestamps
    end
  end
end
