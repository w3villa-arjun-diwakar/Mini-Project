class AddPolicyIdToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :policy_id, :int
  end
end
