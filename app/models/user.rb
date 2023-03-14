class User < ApplicationRecord
  has_many :user_companies
  has_many :companies, through: :user_companies

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
