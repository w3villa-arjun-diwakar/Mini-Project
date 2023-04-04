class CarInsuranceUser < ApplicationRecord
    validates :name, presence: true , length: { minimum:4, maximum:20}
    validates :email, presence: true 
    validates :car_number, presence: true 
    validates :phone, presence: true , length: { minimum:10, maximun:10}
end
