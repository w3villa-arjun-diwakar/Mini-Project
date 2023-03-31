class Policy < ApplicationRecord
    has_many :companies, dependent: :destroy
    has_one_attached :image
    validates :title, presence: true , length: { minimum:8}
end
