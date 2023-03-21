class Policy < ApplicationRecord
    has_many :companies
    has_one_attached :image
end
