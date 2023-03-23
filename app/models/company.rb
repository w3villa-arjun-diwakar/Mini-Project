class Company < ApplicationRecord
    belongs_to :policy
    has_many :user_companies
    has_many :users, through: :user_companies
    has_one_attached :pdf
end
