class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A\S+@\S+\.\S+\z/, message: 'は@を含む必要があります' }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/.freeze
  validates :password, presence: true,
                       format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
  validates :last_name, :first_name, presence: true,
                                     format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
  validates :last_name_kana, :first_name_kana, presence: true,
                                               format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
  validates :birthday, presence: true
end
