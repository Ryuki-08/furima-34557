class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /^[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true, format: { with: /^[ぁ-んァ-ン一-龥]/}
  validates :family_name_kana, presence: true, format: { with: /^([ァ-ン]|ー)+$/}
  validates :first_name_kana, presence: true, format: { with: /^([ァ-ン]|ー)+$/}
  validates :birthday, presence: true
  validates :encrypted_password, confirmation: true, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

  
end
