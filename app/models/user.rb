class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :purchases
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name, :first_name,
              format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :last_name_kana, :first_name_kana,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
    validates :birthday
  end
  validates :email, uniqueness: true,
                    format: { with: /\A\S+@\S+\.\S+\z/, message: 'は@を含む必要があります' }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/.freeze
  validates :password,
            format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
end
