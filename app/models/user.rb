class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:phone_number]
  has_many :doctors, through: :cases
  has_many :cases, dependent: :destroy
  has_one_attached :avatar

  validates :phone_number, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/ }

  def email_required?
    false
  end

  def fullname
    "#{name} #{surname}"  
  end

  def admin?
    admin
  end
end
