class Doctor < ApplicationRecord
  belongs_to :category, optional: true
  has_many :users, through: :cases
  has_many :cases, dependent: :destroy
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:phone_number]

  validates :phone_number, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/ },
                           uniqueness: true

  def fullname
    "#{name} #{surname}"  
  end
  
  def email_required?
    false
  end
end
