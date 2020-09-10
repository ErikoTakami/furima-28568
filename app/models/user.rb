class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :encrypted_password, length: { minimum: 6 }
  validates :encrypted_password, format: { with: /\A[a-zA-Z0-9]+\z/ }
  # validates :
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
end
