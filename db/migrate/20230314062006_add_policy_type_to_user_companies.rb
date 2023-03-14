class AddPolicyTypeToUserCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :user_companies, :policy_type, :string
  end
end
