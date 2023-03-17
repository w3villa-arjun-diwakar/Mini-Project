class User < ApplicationRecord
  has_many :user_companies
  has_many :companies, through: :user_companies
  # pay_customer stripe_attributes: :stripe_attributes
  # include Pay::Billable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_one_attached :avatar
  # validates :phone, phone: true
  after_commit :add_default_avatar, on: %i[ create update]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
          user = User.create(
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "40x40!").processed 
    else
      "/user.png"
    end
  end

  # def stripe_attributes(pay_customer)
  #   {
  #     address: {
  #       city: pay_customer.owner.city,
  #       country: pay_customer.owner.country
  #     },
  #     metadata: {
  #       pay_customer_id: pay_customer.id,
  #       user_id: id # or pay_customer.owner_id
  #     }
  #   }
  # end

  # def pay_should_sync_customer?
  #   # super will invoke Pay's default (e-mail changed)
  #   super || self.saved_change_to_address? || self.saved_change_to_name?
  # end

  private 

  def add_default_avatar
      unless avatar.attached?
        avatar.attach(
          io: File.open(
            Rails.root.join(
              'app', 'assets', 'images', 'user.png'
            )
          ), filename: 'user.png',
          content_type: 'image/png'
        )
      end
  end
  
end
