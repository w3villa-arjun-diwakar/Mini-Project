class LifeInsuranceUser < ApplicationRecord
    validates :name, presence: true , length: { minimum:4, maximum:20}
    validates :age, presence: true 
    validates :gender, presence: true 
    validates :phone, presence: true , length: { minimum:10, maximun:10}
end
