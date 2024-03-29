class Company < ApplicationRecord
    belongs_to :policy
    has_many :user_companies
    has_many :users, through: :user_companies
    has_one_attached :pdf
    has_one_attached :image
    validates :company_name, presence: true 
    def self.ransackable_attributes(auth_object = nil)
        ["company_name", "cover", "created_at", "id", "plan_info", "policy_id", "premium", "updated_at"]
    end
end
