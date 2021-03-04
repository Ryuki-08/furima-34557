class User < ApplicationRecord
  has_many :items
  has_many :buys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birthday
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :family_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :family_name_kana
    validates :first_name_kana
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
