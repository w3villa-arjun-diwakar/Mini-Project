class Policy < ApplicationRecord
    has_many :companies
    has_one_attached :image
    validates :title, presence: true , length: { minimum:8}
end
